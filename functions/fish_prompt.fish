function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -q CONDA_DEFAULT_ENV; and printf "(%s) " $CONDA_DEFAULT_ENV
    set -q JULIA_PROJECT; and printf "(%s) " (basename $JULIA_PROJECT)

    set -l git
    if set -q fish_no_git
        set git ""
    else if df . -t osxfuse -t fuse.sshfs > /dev/null 2> /dev/null
        set git "(fuse)"
    else
        set git (__fish_git_prompt '(%s)')
    end

    printf "%s%s:%s%s%s %s" (set_color green) $_prompt_hostname (set_color blue) (prompt_pwd) (set_color yellow) $git

    if [ $last_status = 0 ]
        printf '%s$ ' (set_color normal)
    else
        printf '%s$%s ' (set_color red) (set_color normal)
    end
end
