function pop -d "Pop an item from list"
    set item $argv[1]
    set list $argv[2..-1]
    set idx (contains --index $item $list)
    and switch $idx
        case 1
            set lout $list[2..-1]
        case (count $list)
            set lout $list[1..-2]
        case '*'
            set lout $list[1..(expr $idx - 1) (expr $idx + 1)..-1]
    end
    or set lout $list
    echo $lout
end

