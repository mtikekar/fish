function laptop_setup
    set -gx HOSTNAME (hostname)
    set -l opt /home/mtikekar/.local/opt
    for p in ~/.local/bin ~/.cabal/bin $opt/anaconda/bin $opt/texlive/2013/bin/x86_64-linux $opt/dart $opt/energia/0101E0014 begin
        [ -d $p ]; and set -gx PATH $p $PATH
    end
end

