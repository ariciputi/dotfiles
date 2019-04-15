function fish_right_prompt
	set -l last_status $status

	if test $last_status -ne 0
            echo -n -s '(' (set_color red) $last_status (set_color normal) ') '
        end

        _prompt_command_duration

        # Set date/time
        set -l _date (date "+%a %d %b")
        set -l _time (date "+%T")

        set_color brblack
        echo -n -s $_date ' ' $_time
        set_color normal
end

