#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

CHMOD=700
create_dot_dir "$HOME/.ssh" $CHMOD

create_relative_links $BASE_DIR $HOME/.ssh

substep_success "Done with ssh."
