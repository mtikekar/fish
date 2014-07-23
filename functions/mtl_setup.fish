function mtl_setup
    setenv PATH (pop '.' $PATH)

    # setup MODULEPATH for environment modules
    module use (find /u/cad/modulefiles -mindepth 1 -maxdepth 1 -not -name '.*' -type d)
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
