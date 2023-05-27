function srs --description 'Activate SRS environment (if present)'
    if test -n "$argv[1]"
        set srs_dir "$HOME/sp/$argv[1]"
    else
        set srs_dir "$HOME/sp/srs"
    end

    if not test -e $srs_dir
        echo "$srs_dir not found."
        return 1
    end

    exec bash -c "source $srs_dir/activate.sh; exec fish"
end

