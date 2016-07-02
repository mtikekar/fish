function setenv
    switch $argv[1]
        case PATH MANPATH CDPATH
            set -gx $argv[1] (string split : $argv[2])
        case '*'
            set -gx $argv[1] $argv[2]
    end
end
