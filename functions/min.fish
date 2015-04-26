function min
    set -l m $argv[1]
    for v in $argv[2..-1]
        [ $v -lt $m ]; and set m $v
    end
    echo $m
end
