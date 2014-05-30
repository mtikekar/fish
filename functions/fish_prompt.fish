function fish_prompt --description 'Write out the prompt'
	set -l last_status $status
    set -l pwd (prompt_pwd)
    set -l git (__fish_git_prompt)
    if [ $status != 0 ]; set git " "; end

    if begin; expr $TERM : screen >/dev/null; and set -q TMUX; end
        set -l tmux_id (tmux display -p "#D")
        tmux setenv -g PWD_$tmux_id $pwd
        tmux setenv -g GIT_$tmux_id $git
        tmux refresh -S
    else
        printf "%s%s:%s%s%s%s" (set_color green) $HOST (set_color blue) $pwd (set_color yellow) $git
    end

	if [ $last_status = 0 ]
        printf '%s$ ' (set_color normal)
    else
        printf '%s$%s ' (set_color red) (set_color normal)
    end
end
