#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd "${BASE_DIR}"

. "$SCRIPT_DIR"/common.sh

substep_info "Install arbackup configuration."

create_dot_dir "$HOME/.config/arbackup"
create_relative_links "${BASE_DIR}" "${HOME}/.config/arbackup"

substep_info "Install arbackup binaries."

mkdir -p "${HOME}/.local/bin"

find bin/ -type f -perm -u=x | while read bin_script; do
     cp -v "${bin_script}" "${HOME}/.local/bin/"
done

substep_info "Schedule backup."

cp "${BASE_DIR}/org.ariciputi.arbackup.plist" "${HOME}/Library/LaunchAgents/"
launchctl load "${HOME}/Library/LaunchAgents/org.ariciputi.arbackup.plist"

substep_success "Done with backup script."
