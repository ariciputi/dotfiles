function _prompt_command_duration
    set --local command_duration

    # Get command execution duration
    if test -n "$CMD_DURATION"
        set command_duration (_format_time $CMD_DURATION 5)
    end
    set --local command_duration_color "$pure_color_command_duration"


    if test -n "$command_duration"
        echo -n -s (set_color normal) '[' (set_color 8a8a8a) "$command_duration" (set_color normal) '] '
    end
end
