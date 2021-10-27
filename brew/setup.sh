#! /usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
SCRIPT_DIR="$(cd "$(dirname "$0")/../script"; pwd -P)"

cd $BASE_DIR

. "$SCRIPT_DIR"/common.sh

substep_info "Install Command Line Tools (CLT) for Xcode."

xcode-select --install

substep_info "Install Homebrew."

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

substep_info "Install basic brew packages."

brew bundle --file "$BASE_DIR"/brew/Brewfile

substep_success "Done with Homebrew."
