#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_relative_links $BASE_DIR $HOME

mkdir -p ${HOME}/.local/bin

find bin/ -type f -perm -u=x | while read bin_script; do
     cp -v $bin_script ${HOME}/.local/bin/
done

substep_success "Done with tmux."
