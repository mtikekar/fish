[ (domainname) = mtl ]; and mtl_setup
[ (hostname) = mtikekar-Satellite-U845 ]; and laptop_setup
[ (hostname) = mtikekar-XPS-13-9343 ]; and laptop_setup

[ -f ~/.dircolors ]; and eval (dircolors -c ~/.dircolors)

set -gq HOSTNAME; or set -gx HOSTNAME (hostname)

set -gx BROWSER firefox
set -gx PAGER less
set -gx LESS -r

set -gx EDITOR vi
set -gx VISUAL vi
contains $__fish_bin_dir $PATH; or set PATH $__fish_bin_dir $PATH

set fish_greeting ''
fish_vi_key_bindings

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

# fish setup

set fish_color_search_match --background=$solarized_base3
set fish_color_command $solarized_green
set fish_color_error $solarized_orange
set fish_color_quote $solarized_cyan
set fish_color_autosuggestion $solarized_base01
set fish_color_comment $solarized_base0
set fish_color_redirection $solarized_violet
set fish_color_param $solarized_base1
set fish_color_history_current $solarized_cyan
