#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_dot_dir "${HOME}/.config/fish"

create_relative_links "${BASE_DIR}" "${HOME}/.config/fish"
create_relative_links "${BASE_DIR}/functions" "${HOME}/.config/fish/functions"

