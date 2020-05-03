# Defined in /var/folders/s3/4qxq5shd1fsgm01w3gmgzflh0000gp/T//fish.ujLuj3/rgvi.fish @ line 2
function rgcode --description 'Search for the given pattern and open in VS Code (all params are passed directly to rg)'
    set result (rg --color=always --line-number --smart-case $argv | fzf --ansi --preview 'preview.sh {}') ; or return $status

    set file_path (echo $result|cut -d: -f1-2)

    code -g "$file_path"
end
