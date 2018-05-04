function tabify
    set -l fi $argv[1]
    set -l ftmp (mktemp)
    unexpand --first-only -t 4 $fi > $ftmp
    grep -n -P '^\t* ' $ftmp
    or begin
        mv $ftmp $fi
        echo "Converted spaces to tabs in $fi"
    end
end
