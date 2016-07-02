function laptop_setup
    set -gx HOSTNAME (hostname)
    prepend_path ~/.local
    prepend_path ~/.local/opt/miniconda
end

function prepend_path
    [ -d $argv/bin ]; and set -gx PATH $argv/bin $PATH
    [ -d $argv/share/man ]; and set -gx MANPATH $argv/share/man $MANPATH
end
