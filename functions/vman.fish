function vman -d "use vim to view man pages. Ctrl-] to follow link and Ctrl-t to go back"
    view -c "set ft=man" -c "Man $argv"
end

