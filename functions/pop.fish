function pop -d "Pop first instance of an item from list. Returns success if it found the item."
    # cannot use the builtin 'contains' because it aggressively tries to parse all its arguments
    # as options. so contains --index -a -v -b -c gives an error
    set -l item $argv[1]
    set -l found 0
    for i in $argv[2..-1]
        [ $i != $item ]; or [ $found = 1 ]; and echo $i; or set found 1
    end
    [ $found = 1 ]
end
