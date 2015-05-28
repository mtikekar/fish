function _help
    echo "mtl ijulia [port]"
    echo "mtl fs"
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

function _fs --description "Mount or unmount MTL filesystem using sshfs"
    set mnt $HOME/.mtl
    set src apsara.mit.edu:/
    # check if mounted
    if df $mnt --output=source | grep -qF $src
        fusermount -u $mnt
        echo "MTL fs unmounted"
        [ -L $HOME/mtl ]; and rm $HOME/mtl
    else
        echo "Mounting MTL fs at $mnt"
        mkdir -p $mnt
        sshfs -o idmap=user,compression=yes,transform_symlinks $src $mnt

        [ $status = 0 ]; and begin
            echo "Mount successful"
            ln -s $HOME/.mtl/homes/mtikekar $HOME/mtl
            echo "MTL home linked to $HOME/mtl"
        end
    end
end

function _mosh
	mosh athena.dialup --server='athrun mosh_project mosh-server' ssh wits
end

function mtl --description "Connect to MTL via a variety of methods"
    set argc (count $argv)
    if [ $argc = 0 ]
        _help
    else
        set fn $argv[1]
        [ $argc = 1 ]; and set args ''; or set args $argv[2..-1]
        switch $fn
            case ijulia fs mosh
                eval _$fn $args
            case '*'
                _help
        end
    end
end
