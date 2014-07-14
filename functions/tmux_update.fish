function tmux_update --description 'Update login session variables in shell'
    function setv
        eval (tmux showenv $argv[1] | perl -pe 's|(.*?)=(.*)|set -gx \1 \2|;' -pe 's|^-(.*)|set -e \1|;')
    end

    setv SESSION_MANAGER
    setv DBUS_SESSION_BUS_ADDRESS
    setv DISPLAY
    setv SESSION_MANAGER
    setv SSH_AUTH_SOCK
    setv WINDOWID
    setv XAUTHORITY
end
