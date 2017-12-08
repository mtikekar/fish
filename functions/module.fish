switch (uname)
    case Linux
        function module
            eval (modulecmd tcsh $argv)
        end
    case Darwin
        source ~/.local/opt/modules-tcl/v1.923/init/fish
end
