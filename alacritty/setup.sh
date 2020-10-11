#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd "${BASE_DIR}"

. "${SCRIPT_DIR}/common.sh"

create_dot_dir "$HOME/.config/alacritty"

create_relative_links "${BASE_DIR}" "${HOME}/.config/alacritty"

substep_success "Done with alacritty."
