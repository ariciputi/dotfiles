function gignore \
    --description="Retrieve Git ignore file content from gitignore.io"

    if test (count $argv) -eq 0
        echo "usage: gignore [ignore_1] [ignore_2] ... "
    else
        set --local ignore (string join , $argv)
        curl -sL https://www.toptal.com/developers/gitignore/api/$ignore
    end
end

function __fish_print_gitignore_list
    if ! set -q __FISH_PRINT_GITIGNORE_LIST
       set -g __FISH_PRINT_GITIGNORE_LIST (curl -sL https://www.toptal.com/developers/gitignore/api/list)
    end
    echo $__FISH_PRINT_GITIGNORE_LIST | string split ","
end

complete --command gignore --arguments '(__fish_print_gitignore_list)'
