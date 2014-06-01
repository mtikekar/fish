function mtlhome --description "Mount or unmount MTL home of sshfs"
    set mnt $HOME/mtl
    # attempt to unmount. if unsuccessful, then mount
    fusermount -u $mnt ^/dev/null
    if [ $status = 0 ]
        echo "MTL home unmounted successfully from $mnt"
    else
        echo "Attempting to mount MTL home"
        mkdir -p $mnt
        sshfs -o idmap=user -C chitra.mit.edu:/homes/mtikekar $mnt
        [ $status = 0 ]; and echo "MTL home mounted at $mnt"
    end
end
