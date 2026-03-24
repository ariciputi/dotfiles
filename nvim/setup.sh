#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd "${BASE_DIR}"

. "${SCRIPT_DIR}/common.sh"

create_dot_dir "$HOME/.config/nvim/lua/config/plugins"

create_relative_links "${BASE_DIR}" "${HOME}/.config/nvim"
create_relative_links "${BASE_DIR}/lua/config" "${HOME}/.config/nvim/lua/config"
create_relative_links "${BASE_DIR}/lua/config/plugins" "${HOME}/.config/nvim/lua/config/plugins"

substep_success "Done with nvim."
