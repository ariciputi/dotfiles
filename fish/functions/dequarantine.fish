function dequarantine --description 'Remove quarantine from all apps in /Applications'

    sudo find /Applications -depth 1 -name '*.app' -xattrname com.apple.quarantine -exec xattr -dr com.apple.quarantine {} \;
end
