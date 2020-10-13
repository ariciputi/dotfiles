function set_fish_colors -d 'set fish user colors if not set or if --force is specified'
  if begin; not set -q -U _fish_colors_defined; or test "$argv[1]" = --force; end
    set -U _fish_colors_defined true

    set -U fish_color_autosuggestion 8a8a8a
    set -U fish_color_cancel normal
    set -U fish_color_command 0087d7
    set -U fish_color_comment 6c6c6c
    set -U fish_color_cwd 008000
    set -U fish_color_cwd_root 800000
    set -U fish_color_end 00d700
    set -U fish_color_error ff5f5f
    set -U fish_color_escape 00a6b2
    set -U fish_color_history_current normal
    set -U fish_color_host normal
    set -U fish_color_host_remote yellow
    set -U fish_color_match normal
    set -U fish_color_normal normal
    set -U fish_color_operator 00a6b2
    set -U fish_color_param 87d7ff
    set -U fish_color_quote ffd787
    set -U fish_color_redirection 5fd7ff
    set -U fish_color_search_match ffff00
    set -U fish_color_selection c0c0c0
    set -U fish_color_status red
    set -U fish_color_user 00ff00
    set -U fish_color_valid_path normal

    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D\x1eyellow
    set -U fish_pager_color_prefix white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
    set -U fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan

  end
end
