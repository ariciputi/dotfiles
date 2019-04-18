function fish_prompt --description 'Write out the prompt'

    # Choose prompt color according to last command status
    test $status -ne 0;
        and set -l status_colors 600 900 c00 # shades of red
        or set -l status_colors 333 666 aaa # shades of gray

    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    # Set suffix and current working dir color according to user identity
    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    # Prompt's first line
    set_color 34D2B2 # green-ish
    printf '%s' $USER
    set_color normal
    printf ' at '

    set_color 3DC1FF # pale blue
    printf '%s' (prompt_hostname)
    set_color normal
    printf ' in '

    set_color D783FF # pale purple
    printf '%s' (prompt_pwd)
    set_color normal

    set -l _vcs_prompt (__fish_vcs_prompt)
    if test -n "$_vcs_prompt"
        echo -n -s $_vcs_prompt
    end

    if test $VIRTUAL_ENV
        set_color yellow
        printf " (%s)" (basename $VIRTUAL_ENV)
        set_color normal
    end

    # Prompt's second line
    echo

    for cc in $status_colors
        echo -n -s (set_color $cc) "$suffix"
    end
    echo -n -s (set_color normal) ' '
end