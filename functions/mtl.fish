function _help
    echo "Usage:"
    echo "  mtl notebook [port]"
    echo "  mtl mount"
    echo "  mtl unmount"
    echo "  mtl mosh"
    echo "  mtl ssh"
    echo "  mtl x11vnc"
end

function _notebook --description "Start Jupyter notebook on wits"
    switch (count $argv)
        case 0
            set -l port 8888
        case 1
            set -l port $argv[1]
        case '*'
            echo "Wrong number of arguments. Run notebook or notebook <port>."
            return -1
    end

	open http://127.0.0.1:$port
	ssh -L $port:localhost:$port wits -n "nohup ipython notebook --no-browser --port=$port --port-retries=0; sleep 10"
end

function _mount --description "Mount MTL filesystem using sshfs"
    set -l mnt ~/.mtl
    set -l src wits.mit.edu:/
    # check if mounted
    if findmnt $mnt >/dev/null ^&1
        echo "Already mounted"
    else
        echo "Mounting MTL fs at $mnt"
        mkdir -p $mnt
        sshfs -o reconnect,idmap=user,transform_symlinks $src $mnt

        [ $status = 0 ]; and begin
            echo "Mount successful"
            [ -L ~/mtl ]; or begin
                ln -sT ~/.mtl/homes/mtikekar ~/mtl
                echo "MTL home linked to ~/mtl"
            end
        end
    end
end

function _unmount --description "Unmount MTL filesystem"
    set -l mnt ~/.mtl
    fusermount -u $mnt; and [ -L ~/mtl ]; and rm ~/mtl
end

function _mosh
    mosh athena.dialup.mit.edu --ssh='ssh -C' --server='athrun mosh_project mosh-server' ssh wits
end

function _ssh
    ssh -CX wits
end

function _x11vnc
    ssh -tCL 5900:localhost:5900 wits '~/share/programs/x11vnc/bin/x11vnc -xrandr -localhost -display :0'
end

function mtl --description "Connect to MTL via a variety of methods"
    set -l argc (count $argv)
    set -l fn ''
    set -l args ''
    [ $argc -gt 0 ]; and set fn $argv[1]
    [ $argc -gt 1 ]; and set args $argv[2..-1]


    switch $fn
        case notebook mount unmount mosh ssh x11vnc
            eval _$fn $args
        case '*'
            _help
    end
end
