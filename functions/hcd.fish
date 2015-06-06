function hcd
	set -l i 1
    set -l dirs
    for d in $dirprev
        contains $d $dirs
        or begin
            echo $i $d
            set dirs $dirs $d
            set i (math $i + 1)
        end
    end

    read -p 'echo "select a number: "' n
    cd $dirs[$n]
end
