[ -f ~/.dircolors ]; and eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

remove_dot_from_path
set -x PATH /homes/mtikekar/texlive/2013/bin/x86_64-linux $PATH

echo -n (tput smkx) > /dev/tty

set -x BROWSER firefox

# git prompt options
set __fish_git_prompt_showdirtystate 1

# colors to be used with solarized theme in terminal
set solarized_base03  002b36 # darkest
set solarized_base02  073642
set solarized_base01  586e75
set solarized_base00  657b83
set solarized_base0   839496
set solarized_base1   93a1a1
set solarized_base2   eee8d5
set solarized_base3   fdf6e3 # lightest
set solarized_yellow  b58900
set solarized_orange  cb4b16
set solarized_red     red    # hex values get approximated to orange
set solarized_magenta d33682
set solarized_violet  6c71c4
set solarized_blue    268bd2
set solarized_cyan    2aa198
set solarized_green   859900

# useful variables
set wwwhome /u/www/htdocs/researchgroups/icsystems
set tsmchome /u/tsmc/CLN45GS/TSMCHOME
set bschome /homes/mtikekar/local/opt/Bluespec

# prevent others from writing to terminal
mesg no
