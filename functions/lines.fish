function lines
    # lines : print all lines
    # lines <n> : print n'th line
    # lines <n1> <n2> : print lines n1 to n2
    # lines <n1> +<n2> : print n2 lines starting from n1
    set -l lines_tail +0
    set -l lines_head -0

    switch (count $argv)
        case 0
        case 1
            set lines_tail +$argv[1]
            set lines_head 1
        case 2
            set lines_tail +$argv[1]
            if string match -qr '^\+' $argv[2]
                set lines_head $argv[2]
            else
                set lines_head (math $argv[2] - $argv[1] + 1)
            end
    end

    tail -n $lines_tail | head -n $lines_head
end

