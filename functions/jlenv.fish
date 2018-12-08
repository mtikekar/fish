function jlenv -a cmd path -d "Activate and deactivate julia environments"
    switch "$cmd"
        case activate
            set -gx JULIA_PROJECT (readlink -e $path)
        case deactivate
            set -ge JULIA_PROJECT
        case '*'
            echo 'jlenv [activate path | deactivate]'
    end
end
