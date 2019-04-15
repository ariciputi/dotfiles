# Set dir length in the prompt
set -g fish_prompt_pwd_dir_length 3

#set -g __fish_git_prompt_color_branch 008E00 #48B439

set -g __fish_git_prompt_show_informative_status yes
set -g __fish_git_prompt_showcolorhints yes

# Fish pagination function is handy, but it is bound by default to
# "\ep" which is deeply wired into my brain as seach history backward.
# Since pagination is done by `less` and "\el" is already taken I
# pick up "\eL".
bind --user \eL __fish_paginate

# History search backward and forward are wired into my brain too
# deeply, not to have them bound.
bind --user \ep history-search-backward
bind --user \en history-search-forward

# These are similar to "\e_" from bash which I got used to after
# many years on Linux/bash. It might be useful to keep them around.
bind --user \eP history-token-search-backward
bind --user \eN history-token-search-forward

# One thing I find hard to get used to in fish is "\ce" to accept
# the proposed command on the command line, and I don't either like
# the Right Arrow (too far away on the keyboard). So I'm trying to
# use Shift-Tab (back-tab or btab in terminfo parlance) and see if
# I like it or not.
# References here:
# https://pubs.opengroup.org/onlinepubs/7908799/xcurses/terminfo.html
# https://unix.stackexchange.com/questions/238406/why-does-shift-tab-result-in-escape-in-the-terminal
# https://invisible-island.net/ncurses/man/terminfo.5.html
#bind --user --key btab forward-char
#bind --user --key btab forward-char
