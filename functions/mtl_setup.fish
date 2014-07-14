function mtl_setup
    remove_dot_from_path

    # setup MODULEPATH for environment modules
    module use (find /u/cad/modulefiles -maxdepth 1 -type d)
    module use /u/anantha/workspace3/share/programs/modulefiles

    # setup commonly used programs
    use use.own
    use python
    use vim
    use Bluespec

    # useful variables
    set -g wwwhome /u/www/htdocs/researchgroups/icsystems
    set -g tsmchome /u/tsmc/CLN45GS/TSMCHOME
    set -g share /u/anantha/workspace3/share

    # prevent others from writing to terminal
    mesg no
end
