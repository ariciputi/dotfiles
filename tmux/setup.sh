#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh


DEPLOY_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/dotfiles/tmux"

create_deploy_dir $DEPLOY_DIR

deploy_config_files $DEPLOY_DIR

create_relative_link $DEPLOY_DIR/tmux.conf $HOME/.tmux.conf

substep_success "Done with tmux."
