function use
    set -l opt
    set -l mod
	switch (count $argv)
        case 1
            switch $argv[1]
                case --help --rm
                    set opt help
                case --list
                    set opt list
                case --avail
                    set opt avail
                case '*'
                    set opt add
                    set mod $argv[1]
            end
        case 2
            switch $argv[1]
                case --rm
                    set opt rm
                    set mod $argv[2]
                case --help --list
                    set opt help
                case --avail
                    set opt avail
                    set mod $argv[2]
                case '*'
                    set opt add
                    set mod $argv[1]/$argv[2]
            end
        case 3
            switch $argv[1]
                case --rm
                    set opt rm
                    set mod $argv[2]/$argv[3]
                case '*'
                    set opt help
            end
        case '*'
            set opt help
    end

    switch $opt
        case help
            echo "use <module> [<version>]      : Setup MTL CAD or anantha-group share module"
            echo "use --rm <module> [<version>] : Remove environment settings for module"
            echo "use --list                    : List used modules in the format: <module>/<version>"
            echo "use --avail [<module>]        : List available modules (some MTL modules are missing)"
            echo "use --help                    : Show this screen"
        case list
            module list
        case rm
            module rm $mod
        case avail
            module avail $mod
        case add
            module add $mod
    end
end
