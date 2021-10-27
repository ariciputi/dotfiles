#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

substep_info "Install pyenv."

curl https://pyenv.run | bash

substep_success "Done with pyenv."
