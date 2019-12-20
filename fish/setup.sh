#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_dot_dir "${HOME}/.config/fish/functions"

create_relative_links "${BASE_DIR}" "${HOME}/.config/fish"
create_relative_links "${BASE_DIR}/functions" "${HOME}/.config/fish/functions"
create_relative_links "${BASE_DIR}/completions" "${HOME}/.config/fish/completions"

if [ $(which fish) ] && [ ! $(grep -q -e "fish" /etc/shells) ]; then
    substep_info "Add fish to the shells catalog"

    sudo sh -c 'cat >> /etc/shells' <<-EOF

# Fish shell
/usr/local/bin/fish
EOF

fi

substep_info "Set fish as your default shell"
sudo chsh -s /usr/local/bin/fish $(whoami)

substep_success "Done with fish."
