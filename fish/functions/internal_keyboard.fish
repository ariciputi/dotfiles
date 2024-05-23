# See here <https://askubuntu.com/questions/160945/is-there-a-way-to-disable-a-laptops-internal-keyboard> for reference.

function internal_keyboard --description 'Turn laptop internal keyboard on/off'
    argparse --min-args 1 --max-args 1 -- $argv
    or begin
        echo "usage: internal_keyboard on/off"
        return 1
    end

    set master_kb_id (xinput list | grep -e "master keyboard" | sed -nr 's/^.*id=([0-9]+).*$/\1/p')
    set internal_kb_id (xinput list | grep -e "AT Translated Set 2 keyboard" | sed -nr 's/^.*id=([0-9]+).*$/\1/p')

    if xinput list | grep -e "AT Translated Set 2 keyboard" | grep -q "floating"
        set kb_status "off"
    else
        set kb_status "on"
    end

    switch $argv[1]
        case on
            if test $kb_status = "on"
                return 0
            end

            xinput reattach $internal_kb_id $master_kb_id

        case off
            if test $kb_status = "off"
                return 0
            end

            xinput float $internal_kb_id

        case '*'
            echo "Unknown value: $argv[1]"
            return 1
    end
end
