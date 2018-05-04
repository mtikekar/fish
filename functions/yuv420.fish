function yuv420
    set -l fname (basename $argv)
    set -l size (string match -r 'qcif|cif|720p|1080p|2160p|\d+x\d+' $fname)
    switch $size
        case qcif
            set size 176x144
        case cif
            set size 352x288
        case 720p
            set size 1280x720
        case 1080p
            set size 1920x1080
        case 2160p
            set size 3840x2160
        case ""
            echo "Couldn't guess size of $argv" 1>&2
            return 1
    end

    echo "Guessed size $size" 1>&2
    ffplay -video_size $size $argv
end
