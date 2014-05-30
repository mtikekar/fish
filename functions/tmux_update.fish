function tmux_update --description 'Update login session variables in shell'
    set -x SESSION_MANAGER (tmux showenv SESSION_MANAGER)
    set -x DBUS_SESSION_BUS_ADDRESS (tmux showenv DBUS_SESSION_BUS_ADDRESS)
    set -x DISPLAY (tmux showenv DISPLAY)
    set -x SESSION_MANAGER (tmux showenv SESSION_MANAGER)
    set -x SSH_AUTH_SOCK (tmux showenv SSH_AUTH_SOCK)
    set -x WINDOWID (tmux showenv WINDOWID)
    set -x XAUTHORITY (tmux showenv XAUTHORITY)
end
