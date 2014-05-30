function mtl_setup
    remove_dot_from_path
    set -x PATH /homes/mtikekar/texlive/2013/bin/x86_64-linux $PATH

    # useful variables
    set wwwhome /u/www/htdocs/researchgroups/icsystems
    set tsmchome /u/tsmc/CLN45GS/TSMCHOME
    set bschome /homes/mtikekar/local/opt/Bluespec

    # prevent others from writing to terminal
    mesg no
end
