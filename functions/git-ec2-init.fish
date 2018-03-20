function git-ec2-init
    git init .
    git config --add receive.denyCurrentBranch ignore
    set -l hook .git/hooks/post-receive
    echo "#!/bin/bash" > $hook
    echo "GIT_WORK_TREE=.. git reset --hard" >> $hook
    chmod +x $hook
end
