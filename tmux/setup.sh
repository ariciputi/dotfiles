#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd "${BASE_DIR}"

. "$SCRIPT_DIR"/common.sh

create_relative_links "${BASE_DIR}" "${HOME}"

substep_info "Install tmux plugins."

create_dot_dir "$HOME/.tmux/plugins"

if [ ! -e "${HOME}/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm" && "${HOME}/.tmux/plugins/tpm/bin/install_plugins"
fi

substep_info "Install tmux binaries."

mkdir -p "${HOME}/.local/bin"

find bin/ -type f -perm -u=x | while read bin_script; do
     cp -v "${bin_script}" "${HOME}/.local/bin/"
done

substep_success "Done with tmux."
