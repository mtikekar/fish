function pop -d "Pop first instance of an item from list"
    set item $argv[1]
    for i in $argv[2..-1]
        [ $i != $item ]; or set -q found; and echo $i; or set found
    end
end
