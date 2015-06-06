function enumerate
    set -l i 1
    for v in $argv
        echo $i $v
        set i (math $i + 1)
    end
end

