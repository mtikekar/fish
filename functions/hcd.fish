function hcd --description 'List dir history and change. Usage: hcd -> input # of directory, or hcd <n>'
    set -l dirs ( printf '%s\n' $dirprev | awk '!_[$0]++' )
    # the awk cmd does uniq on unsorted list

    [ (count $argv) = 1 ]; and set -l n $argv[1]; or begin
        enumerate $dirs
        read -p 'echo "select a number: "' n
    end

    cd $dirs[$n]
end
