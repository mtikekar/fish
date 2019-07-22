function sshfs -w sshfs
    command sshfs -C -o idmap=user,follow_symlinks,reconnect,auto_cache,ServerAliveInterval=15,ServerAliveCountMax=3 $argv
end

