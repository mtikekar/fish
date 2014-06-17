function tmux_update --description 'Update login session variables in shell'
    setenv SESSION_MANAGER (tmux showenv SESSION_MANAGER)
    setenv DBUS_SESSION_BUS_ADDRESS (tmux showenv DBUS_SESSION_BUS_ADDRESS)
    setenv DISPLAY (tmux showenv DISPLAY)
    setenv SESSION_MANAGER (tmux showenv SESSION_MANAGER)
    setenv SSH_AUTH_SOCK (tmux showenv SSH_AUTH_SOCK)
    setenv WINDOWID (tmux showenv WINDOWID)
    setenv XAUTHORITY (tmux showenv XAUTHORITY)
end
