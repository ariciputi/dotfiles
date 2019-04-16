#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

create_dot_dir "${HOME}/.config/karabiner"

# Karabiner doesn't work with symlinks; an hard-link is used instead
KARABINER_CONFIG="${HOME}/.config/karabiner/karabiner.json"
if [ -f "${KARABINER_CONFIG}" ]; then
    mv "${KARABINER_CONFIG}" "${KARABINER_CONFIG}.bak"
fi
ln "${BASE_DIR}/karabiner.json" "${KARABINER_CONFIG}"

create_relative_links "${BASE_DIR}/assets/complex_modifications" "${HOME}/.config/karabiner/assets/complex_modifications"

# Test if Karabiner is already installed and if so install Developer profile as system default
KARABINER_CLI="/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"
if [ -x "${KARABINER_CLI}" ]; then
    "${KARABINER_CLI}" --select-profile "Developer"
    sudo "${KARABINER_CLI}" --copy-current-profile-to-system-default-profile
    ln -s "${KARABINER_CLI}" "${HOME}/.local/bin/"
fi
