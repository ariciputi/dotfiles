function _format_time \
    --description="Format milliseconds to a human readable format" \
    --argument-names milliseconds threshold

    if test $milliseconds -lt 0; return 1; end

    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    set --local days (math -s0 "$milliseconds / 86400000")
    set --local how_long

    if test $days -gt 0
        set how_long $how_long (printf "%sd" $days)
    end

    if test $hours -gt 0
        set how_long $how_long (printf "%sh" $hours)
    end

    if test $minutes -gt 0
        set how_long $how_long (printf "%sm" $minutes)
    end

    if test $seconds -gt $threshold
        set how_long $how_long (printf "%ss" $seconds)
    end

    echo -e (string join ' ' $how_long)
end
