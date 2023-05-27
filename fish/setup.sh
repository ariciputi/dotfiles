#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_dot_dir "${HOME}/.config/fish/functions"

create_relative_links "${BASE_DIR}" "${HOME}/.config/fish"
create_relative_links "${BASE_DIR}/functions" "${HOME}/.config/fish/functions"
create_relative_links "${BASE_DIR}/completions" "${HOME}/.config/fish/completions"

if [ $(command -v fish) ] && [[ "$OSTYPE" == "darwin"* ]] && [ ! $(grep -q -e "fish" /etc/shells) ]; then
    substep_info "Add fish to the shells catalog"

    sudo sh -c 'cat >> /etc/shells' <<-EOF

# Fish shell
/opt/homebrew/bin/fish
EOF

fi

substep_info "Install helper binaries."

mkdir -p "${HOME}/.local/bin"

find bin/ -type f -perm -u=x | while read bin_script; do
     cp -v "${bin_script}" "${HOME}/.local/bin/"
done

substep_info "Install Dotnet installer script."

curl -L -O --output-dir "${HOME}/.local/bin" https://dot.net/v1/dotnet-install.sh && chmod +x "${HOME}/.local/bin/dotnet-install.sh"

substep_info "Set fish as your default shell"
fish_path=$(which fish)
sudo chsh -s "${fish_path}" "$(whoami)"

substep_success "Done with fish."
