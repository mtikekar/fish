function max
	set -l m $argv[1]
    for v in $argv[2..-1]
        [ $v -gt $m ]; and set m $v
    end
    echo $m
end
