function fssh
    ssh $argv -t "cd \"$PWD\"; $__fish_bin_dir/fish"
end
