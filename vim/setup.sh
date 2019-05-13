#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd "${BASE_DIR}"

. "${SCRIPT_DIR}/common.sh"

create_dot_dir "$HOME/.vim"

if [ ! -e "${HOME}/.vim/autoload/plug.vim" ]; then
    curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

create_relative_links "${BASE_DIR}" "${HOME}/.vim"

substep_info "Installing plugins..."

VIM_TEMP_DIR="$(mktemp -d)"
# Extract from vimrc just the section related to the plugin
sed -ne '/^call plug#begin/,/^call plug#end/p' "${HOME}/.vim/vimrc" > "${VIM_TEMP_DIR}/vimrc"
# Install all the plugin
vim -u "${VIM_TEMP_DIR}/vimrc" +PlugInstall +qall
# Remove the temporary vimrc file
rm -r "${VIM_TEMP_DIR}"

substep_success "Done with vim."
