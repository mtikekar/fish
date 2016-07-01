function hcd --description 'List dir history and change. Usage: hcd -> input # of directory, or hcd <n>'
	set -l i 1
    set -l dirs
    [ (count $argv) = 1 ]; and set -l n $argv[1]

    for d in $dirprev
        contains $d $dirs
        or begin
            set -q n; or echo $i $d
            set dirs $dirs $d
            set i (math $i + 1)
        end
    end

    set -q n; or read -p 'echo "select a number: "' n
    cd $dirs[$n]
end
