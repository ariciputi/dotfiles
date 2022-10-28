function srs --description 'Activate SRS environment'
    if test -n "$argv[1]"
        set srs_dir "$argv[1]"
    else
        set srs_dir srs
    end

    exec bash -c "source ~/sp/$srs_dir/activate.sh; exec fish"
end

