function pop -d "Pop first instance of an item from list. Returns success if it found the item."
    set listname $argv[1]
    set element $argv[2]
    set idx (contains --index -- $element $$listname)
    if [ $status -eq 0 ]
        set -e {$listname}[$idx]
    else
        return 1
    end
end
