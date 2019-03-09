#! /usr/bin/env bash

is_darwin() { [ $(uname -s) = "Darwin" ] ; }

is_linux() { [ $(uname -s) = "Linux" ] ; }

create_relative_link() {
    local source_file target_file base_dir
    base_dir=${3:-$HOME}
    cd "$base_dir"
    source_file=$(relative_path $base_dir $1)
    target_file=$2

    symlink $source_file $target_file 
}

deploy_config_files() {
    local DEPLOY_DIR="$1"
    rsync --archive --delete --delete-excluded --cvs-exclude --exclude-from=$SCRIPT_DIR/exclude_filter.rsync --quiet . $DEPLOY_DIR
}

create_deploy_dir() {
    substep_info "Creating $1 directory..."
    local deploy_dir chmod_flags backup_dir 
    deploy_dir=$1
    if [ $# -eq 2 ]; then
        chmod_flags="-m $2"
    fi

    if [ -e "$deploy_dir" ]; then
        backup_dir=$deploy_dir.$(date -u +"%FT%T%Z").backup
	substep_info "Dir already exists: creating backup at $backup_dir"
        mv "$deploy_dir" "$backup_dir"
    fi
    
    mkdir -p $chmod_flags "$deploy_dir"
}

# Return relative path from canonical absolute dir path $1 to canonical
# absolute dir path $2 ($1 and/or $2 may end with one or no "/").
# Does only need POSIX shell builtins (no external command)
relative_path () {
    local common path up
    common=${1%/} path=${2%/}/
    while test "${path#"$common"/}" = "$path"; do
        common=${common%/*} up=../$up
    done
    path=$up${path#"$common"/}; path=${path%/}; printf %s "${path:-.}"
}

symlink() {
    OVERWRITTEN=""
    if [ -e "$2" ] || [ -h "$2" ]; then
        OVERWRITTEN="(Overwritten)"
        if ! rm -r "$2"; then
            substep_error "Failed to remove existing file(s) at $2."
        fi
    fi
    if ln -s "$1" "$2"; then
        substep_success "Symlinked $2 to $1. $OVERWRITTEN"
    else
        substep_error "Symlinking $2 to $1 failed."
    fi
}

clear_broken_symlinks() {
    find -L "$1" -type l | while read fn; do
        if rm "$fn"; then
            substep_success "Removed broken symlink at $fn."
        else
            substep_error "Failed to remove broken symlink at $fn."
        fi
    done
}

# Took these printing functions from https://github.com/Sajjadhosn/dotfiles
coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

info() {
    coloredEcho "$1" blue "========>"
}

success() {
    coloredEcho "$1" green "========>"
}

error() {
    coloredEcho "$1" red "========>"
}

substep_info() {
    coloredEcho "$1" magenta "===="
}

substep_success() {
    coloredEcho "$1" cyan "===="
}

substep_error() {
    coloredEcho "$1" red "===="
}

