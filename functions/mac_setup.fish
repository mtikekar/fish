function local_setup
    source /usr/local/opt/modules/init/fish
    # System config.fish in homebrew prepends a bunch of paths.
    # If any of the following modules were loaded by the parent shell,
    # module add commands will do nothing. But I want their paths before the
    # system paths. So, use swap instead of add
    module add use.own
    module swap gnucoreutils
    module swap dotlocal
    module swap python
    module swap miniconda3

    pop PATH .

    alias firefox open

    function ipython
        set -l ipythondir (dirname (command --search ipython))
        set -l pythonwdir (dirname (command --search pythonw))

        if [ $ipythondir = $pythonwdir ]
                pythonw -m IPython $argv
        else
            echo "Running without pythonw. GUI might not work." 1>&2
            command ipython
        end
    end
end
