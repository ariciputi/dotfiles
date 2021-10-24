#!/bin/bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail

#
# Load configuration
#

if [ $# -eq 0 ]; then
    # Search config file in the directory the script is in if not explicitly given
    SCRIPTPATH=$(cd ${0%/*} && pwd -P)
    source "${SCRIPTPATH}/arbackup.config"
else
    # Search config file in the directory given as parameter
    while [ $# -gt 0 ]; do
        case $1 in
            -c)
                if [ -r "$2" ]; then
                        source "$2"
                        shift 2
                else
                        echo "Unreadable config file \"$2\"" 1>&2
                        exit 1
                fi
                ;;
            *)
                echo "Unknown Option \"$1\"" 1>&2
                exit 2
                ;;
        esac
    done
fi;

#
# Fire up a MacOS notification
#

function notify {
    "${HOME}/.config/dotfiles/arbackup/bin/notify" "arbackup" "" "$1"
}

#
# Check if rsync is installed
#

if ! command -v ${RSYNC_EXE} &> /dev/null; then
    echo "${RSYNC_EXE} not found."
    exit 1
fi

#
# Get the name of the WiFi network the Mac is connected to
#

CONNECTED_WIFI=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport --getinfo | sed -n 's/[[:<:]]SSID: //p' | tr -d \[:space:\])

#
# Stop if not connected to the expected network
#

if [ "${CONNECTED_WIFI}" != "${WIFI_NETWORK}" ]; then
    echo "Not connected to the expected network. Done."
    exit 0
fi

#
# Create a very old state file if not already exist
#

if ! [ -e "${STATE_FILE}" ]; then
    touch -t 197001010000 "${STATE_FILE}"
fi

#
# Compute how many seconds passed since the last backup
#

BACKUP_AGE=$(($(date +%s) - $(date -r "${STATE_FILE}" +%s)))

#
# Check if it is time to run the backup or not
#

if [ "${BACKUP_AGE}" -lt "${BACKUP_FREQUENCY}" ]; then
    echo "Backup is fresh enough. Skip."
    exit 0
fi

#
# Actually run the backup
#

notify "Time to backup. Starting..."

if ! "${RSYNC_EXE}" "${RSYNC_OPTS[@]}" "--include-from=${RSYNC_INCLUDE_FILE}" "--exclude-from=${RSYNC_EXCLUDE_FILE}" "--log-file=${RSYNC_LOG_FILE}" "${SOURCE_DIR}" "${TARGET_DIR}"; then
    MESSAGE="Backup failed with status $?"
else
    MESSAGE="Backup done"
    touch "${STATE_FILE}"
fi

notify "${MESSAGE}"
