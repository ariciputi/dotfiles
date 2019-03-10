#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh


DEPLOY_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/dotfiles/vim"

create_deploy_dir $DEPLOY_DIR

deploy_config_files $DEPLOY_DIR

create_dot_dir "$HOME/.vim"

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

create_relative_links $DEPLOY_DIR $HOME/.vim

vim +PluginInstall +qall

substep_success "Done with vim."
