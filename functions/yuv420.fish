function yuv420
	set fname (basename $argv)
	set size (echo $fname | grep -ohP '\d+x\d+')
    or begin
        echo $fname | grep -q qcif
        and set size 176x144
    end
    or begin
        echo $fname | grep -q cif
        and set size 352x288
    end
    or begin
        echo $fname | grep -q 1080p
        and set size 1920x1080
    end
    or begin
        echo $fname | grep -q 2160p
        and set size 3840x2160
    end
    or begin
        echo "Couldn't guess size of $argv" 1>&2
        return 1
    end

    echo "Guessed size $size" 1>&2
    ffplay -video_size $size $argv
end
