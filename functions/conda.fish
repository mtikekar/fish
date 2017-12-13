function _conda_env_path
    command conda info -e | awk '$1 == "'$argv[1]'" {print $NF}'
end

function conda -w conda
    switch "$argv[1]"
    case activate
        test (count $argv) -eq 2; or begin
            echo "Expected: conda activate <env>" 1>&2
            return 1
        end

        set env_name $argv[2]
        set env_path (_conda_env_path $env_name)
        test -n "$env_path"; or begin
            echo "conda env `$env_name` not found" 1>&2
            return 1
        end

        # remove old environment
        set -q CONDA_PREFIX; and pop PATH $CONDA_PREFIX/bin

        # add new environment
        set -gx CONDA_DEFAULT_ENV $env_name
        set -gx CONDA_PREFIX $env_path
        set PATH $env_path/bin $PATH
    case deactivate
        test -n "$CONDA_PREFIX"; or begin
            echo "No conda env currently set"
            return 1
        end

        pop PATH $CONDA_PREFIX/bin
        set -e CONDA_PREFIX
        set -e CONDA_DEFAULT_ENV
    case '*'
        command conda $argv
    end
    return 0
end
