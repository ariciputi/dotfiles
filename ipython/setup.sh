#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_dot_dir "$HOME/.ipython/profile_default/startup"

create_relative_links "${BASE_DIR}/profile_default" "${HOME}/.ipython/profile_default"
create_relative_links "${BASE_DIR}/profile_default/startup" "${HOME}/.ipython/profile_default/startup"
