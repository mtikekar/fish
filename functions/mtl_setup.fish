function mtl_setup
    pop PATH '.'

    # setup MODULEPATH for environment modules
    module use /usr/share/Modules/modulefiles
    module use /u/anantha/workspace3/share/programs/modulefiles
    module use (string trim -r -c / /u/cad/modulefiles/*/)

    # setup commonly used programs
    use use.own
    use python
    use python3
    use editerm
    use bluespec 2014.07.A

    # useful variables
    set -g wwwhome /u/www/htdocs/researchgroups/icsystems
    set -g tsmchome /u/tsmc/CLN45GS/TSMCHOME
    set -g share /u/anantha/workspace3/share
end
