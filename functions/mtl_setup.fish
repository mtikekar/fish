function mtl_setup
    remove_dot_from_path

    # setup MODULEPATH for environment modules
    ls /u/cad/modulefiles > /dev/null
    # that was a dummy line for NFS mount of /u/cad
    module use /u/cad/modulefiles/*
    module use /u/anantha/workspace3/share/programs/modulefiles

    # setup commonly used programs
    use use.own
    use python
    use vim
    use Bluespec

    # useful variables
    set -g wwwhome /u/www/htdocs/researchgroups/icsystems
    set -g tsmchome /u/tsmc/CLN45GS/TSMCHOME

    # prevent others from writing to terminal
    mesg no
end
