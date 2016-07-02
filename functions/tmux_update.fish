function tmux_update --description 'Update login session variables in shell'
    # tmux showenv prints -VAR for removed variables and VAR=value for set variables
    for v in (tmux showenv)
        set -l var (string match -r '^-(.*)' -- $v)
        if [ $status -eq 0 ]
            set -ge $var[2]
        else
            export $v
        end
    end
end
