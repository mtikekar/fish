function _help
    echo "mtl ijulia [port]"
    echo "mtl home"
    echo "mtl mosh"
end

function _ijulia --description "Start IJulia on wits"
    switch (count $argv)
        case 0
            set port 8998
        case 1
            set port $argv[1]
        case '*'
            echo "Wrong number of arguments. Run ijulia or ijulia <port>."
            return -1
    end

	open http://127.0.0.1:$port
	ssh -L $port:localhost:$port wits -t "use python; ipython notebook --profile=julia --no-browser --port=$port --port-retries=0"
end

function _home --description "Mount or unmount MTL home of sshfs"
    set mnt $HOME/.mtl
    set src wits.mit.edu:/
    # check if mounted
    if df $mnt --output=source | grep -qF $src
        fusermount -u $mnt
        echo "MTL home unmounted from $mnt"
    else
        echo "Attempting to mount MTL home"
        mkdir -p $mnt
        sshfs -o idmap=user,compression=yes,transform_symlinks $src $mnt

        [ $status = 0 ]; and echo "MTL home mounted at $mnt"
    end
end

function _mosh
	mosh athena.dialup --server='athrun mosh_project mosh-server' ssh wits
end

function mtl --description "Connect to MTL via a variety of methods"
    set argc (count $argv)
    if [ $argc = 0 ]
        _help
        echo 'hehe'
    else
        set fn $argv[1]
        [ $argc = 1 ]; and set args ''; or set args $argv[2..-1]
        switch $fn
            case ijulia home mosh
                eval _$fn $args
            case '*'
                _help
        end
    end
end
