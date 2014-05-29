function remove_dot_from_path
    for pi in $PATH
        if [ $pi != '.' ]
            set newp $newp $pi
        end
    end
    set -x PATH $newp
end
