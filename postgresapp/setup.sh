#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

substep_info "Set Postgres.app path."

sudo mkdir -p /etc/paths.d &&

echo "/Applications/Postgres.app/Contents/Versions/latest/bin" | sudo tee /etc/paths.d/postgresapp

substep_success "Done with Postgres.app."
