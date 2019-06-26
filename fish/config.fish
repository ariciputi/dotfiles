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

# Alias
alias llh="ls -ld .*" # list only dot files (long form)
alias lv="/usr/share/vim/vim80/macros/less.sh"
alias ..="cd .."

# Set PATH
set -x PATH $HOME/.local/bin $PATH

# Set EDITOR
set -x EDITOR 'vim'

# Force locale
set -gx LC_ALL "en_US.UTF-8"
