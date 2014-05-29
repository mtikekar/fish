eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

remove_dot_from_path
set -x PATH /homes/mtikekar/texlive/2013/bin/x86_64-linux $PATH

if test -e /dev/tty
    echo -n (tput smkx) > /dev/tty
end

set -x BROWSER firefox

# set fish_function_path $fish_function_path /homes/mtikekar/local/opt/anaconda/lib/python2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/fish
# powerline-setup

if begin; [ $TERM = screen-256color ]; and set -q TMUX; end
    function --on-variable PWD __powerline_update_pwd
        set -l tmux_id (tmux display -p "#D")
        tmux setenv -g PWD_$tmux_id (prompt_pwd)

        set prompt_git (__fish_git_prompt)
        if [ $status != 0 ]; set prompt_git " "; end

        tmux setenv -g GIT_$tmux_id $prompt_git
        tmux refresh -S
    end

    __powerline_update_pwd
end

set fish_color_git dc322f
