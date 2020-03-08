function rndpass --description 'Create a random password and copy it to the clipboard'
    if test -n "$argv[1]"
        set password_length "$argv[1]"
    else
        set password_length 12
    end

    env LC_ALL=C tr -dc '[:graph:]' < /dev/urandom | fold -w $password_length | head -n1 | tr -d '\n' | pbcopy

    printf 'Password copied to the clipboard!'
end
