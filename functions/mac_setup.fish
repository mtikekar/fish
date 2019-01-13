function local_setup
    source ~/.local/opt/modules/4.1.0/init/fish
    module add use.own
    module add gnucoreutils
    module add dotlocal
    module add python
    module add miniconda3
    set -gx AWS_SDK_LOAD_CONFIG 1
end
