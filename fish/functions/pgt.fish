function pgt --description 'Connect to PG using a ssh tunnel'

    set conf_file "$HOME/.config/pgt/pgt.json"

    argparse --min-args 1 --max-args 1 'verbose' -- $argv
    or begin
        echo "usage: pgt [--verbose] DB_LABEL"
        return 1
    end

    if not command --query jq
        echo "Please install jq."
        return 1
    else if not test -e $conf_file
        echo "File $conf_file not found."
        echo
        echo 'Please create a configuration file like:

{
    "bastion": "...",
    "dbs": {
        "db_name": {
            "host": "...",
            "port": "...", // optional
            "username": "...",
            "password": "...",
            "database": "..."
        },
        ...
    }
}
'
        return 1
    end

    if set --query _flag_verbose
        function _log
            echo $argv
        end
    else
        function _log
        end
    end

    set db_label $argv[1]
    set configuration (cat $conf_file | jq --raw-output --compact-output .)
    set bastion_host (echo $configuration | jq --raw-output --compact-output .bastion)

    # Weird hack to get around jq requirements of enclosing key name containing '-' with double quotes,
    # which in turns requires that the entire filter expression must be enclosed in single-quotes when
    # given inline, and fish shell not expanding variables when inside single-quotes
    set temp_file ( mktemp )
    printf '.dbs."%s"' $db_label > $temp_file
    set conn_string (echo $configuration | jq --raw-output --compact-output --from-file $temp_file)
    rm $temp_file

    set username (echo $conn_string | jq --raw-output --compact-output .username)
    set password (echo $conn_string | jq --raw-output --compact-output .password)
    set host (echo $conn_string | jq --raw-output --compact-output .host)
    set port (echo $conn_string | jq --raw-output --compact-output '.port // 5432' )
    set database (echo $conn_string | jq --raw-output --compact-output .database)

    _log "Remote conn_string: postgresql://$username:$password@$host:$port/$database"

    while true;
        set local_port (random 10000 32767)
        if not nc -z 127.0.0.1 $local_port
            break
        end
    end

    set tunnel_string $local_port:$host:$port $bastion_host
    _log "SSH tunnel: $tunnel_string"
    set local_conn_string "postgresql://$username:$password@localhost:$local_port/$database"
    _log "Local conn_string: $local_conn_string"

    ssh -f -N -L $tunnel_string

    set tunnel_pid (ps xo pid,command| grep "$tunnel_string" | grep -v grep | awk '{print $1}')
    _log "Tunnel PID: $tunnel_pid"

    set temp_psql_conf ( mktemp )
    _log "Rewrite psqlrc file to $temp_psql_conf to replace prompt"
    sed -E "s|^(\\\\set PROMPT1 'postgresql://%n@)(%M:%>)(/%/ %R%#%x ')|\1<$db_label:$port>\3|" "$HOME/.psqlrc" > $temp_psql_conf

    PSQLRC=$temp_psql_conf psql $local_conn_string

    _log "Killing background tunnel"
    kill -15 $tunnel_pid
    _log "Removing temp psqlrc file"
    rm $temp_psql_conf
end

function __fish_print_pgt_list
    jq --raw-output '.dbs | keys[]' "$HOME/.config/pgt/pgt.json"
end

complete --command pgt --no-files --arguments '(__fish_print_pgt_list)'
