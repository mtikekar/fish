function laptop_setup
    set -gx HOSTNAME (hostname)
    set -l opt /home/mtikekar/.local/opt
    set -gx PATH ~/.local/bin ~/.cabal/bin $opt/anaconda/bin $opt/texlive/2013/bin/x86_64-linux $PATH
end

