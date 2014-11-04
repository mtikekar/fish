function ijulia --description "Start IJulia on wits"
    switch (count $argv)
        case 0
            set port 8998
        case 1
            set port $argv[1]
        case '*'
            echo "Wrong number of arguments. Run ijulia or ijulia <port>."
            return -1
    end

	open http://localhost:$port
	ssh -L $port:localhost:$port wits -t "use python; use julia; ipython notebook --profile=julia --no-browser --port=$port --port-retries=0"
end
