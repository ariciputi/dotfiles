#! /usr/bin/env bash

is_darwin() { [ $(uname -s) = "Darwin" ] ; }

is_linux() { [ $(uname -s) = "Linux" ] ; }

create_relative_links() {
    local source_dir target_dir files_to_link target_relative_path file_prefix

    source_dir=$1
    target_dir=$2
    files_to_link=$( find "$source_dir" -maxdepth 1 -type f -not -iname ".*" -not -iname "setup.sh" -not -iname "*.md" -not -iname "readme*" -exec basename {} \; | xargs echo )

    target_relative_path=$(relative_path $target_dir $source_dir)

    cd "$target_dir"

    if [ "$target_dir" = "$HOME" ]; then
        local file_prefix="."
    fi

    for item in $files_to_link; do
        symlink "$target_relative_path/$item" "$file_prefix""$item"
    done
    cd - > /dev/null
}

create_dir() {
    local new_dir strategy chmod_flags backup_dir

    new_dir=$1
    strategy=$2
    chmod_flags=${3:-$(printf '%o' $((0777 & ~$(umask))))}

    if [ -e "$new_dir" ]; then
        if [ "$strategy" = "backup" ]; then
            backup_dir=$new_dir.$(date -u +"%FT%T%Z").backup
    	    substep_info "Already exists: creating a backup at $backup_dir"
            mv "$new_dir" "$backup_dir"

        elif [ "$strategy" = "delete" ]; then
    	    substep_info "Already exists: deleting $new_dir"
            rm -r "$new_dir"

        elif [ "$strategy" = "skip" ]; then
    	    substep_info "$new_dir already exists: skipping."
            return
        else
    	    substep_error "Strategy '$strategy' not allowed"
        fi
    fi

    mkdir -p -m $chmod_flags "$new_dir"
}

create_dot_dir() {
    local dot_dir chmod_flags

    dot_dir=$1
    chmod_flags=$2

    if [ -h "$dot_dir" ]; then
        create_dir "$dot_dir" "delete" "$chmod_flags"
    elif [ -d "$dot_dir" ]; then
        create_dir "$dot_dir" "skip" "$chmod_flags"
    elif [ -e "$dot_dir" ]; then
        create_dir "$dot_dir" "backup" "$chmod_flags"
    else
        create_dir "$dot_dir" "delete" "$chmod_flags"
    fi

    substep_success "Created $1 directory."
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

