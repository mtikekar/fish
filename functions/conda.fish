function _conda_env_path
    command conda info -e | awk '$1 == "'$argv[1]'" {print $NF}'
end

function conda -w conda
    switch $argv[1]
    case activate
        # remove old environment
        set -q CONDA_PREFIX; and pop PATH $CONDA_PREFIX/bin

        # add new environment
        set env_name $argv[2]
        set env_path (_conda_env_path $env_name)
        set -gx CONDA_DEFAULT_ENV $env_name
        set -gx CONDA_PREFIX $env_path
        set PATH $env_path/bin $PATH
    case deactivate
        pop PATH $CONDA_PREFIX/bin
        set -e CONDA_PREFIX
        set -e CONDA_DEFAULT_ENV
    case '*'
        command conda $argv
    end
end
