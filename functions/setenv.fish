function setenv --description 'handle csh setenv commands for module function'
    set -l var $argv[1]
    set -l val $argv[2..-1]
    if begin contains -- $var PATH MANPATH CDPATH; and [ (count $val) -eq 1 ]; end
        set -gx $var (string split : $val)
    else
        set -gx $var $val
    end
    return 0
end
