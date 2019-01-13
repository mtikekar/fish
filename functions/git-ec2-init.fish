function git-ec2-init
    git init .
    git config --add receive.denyCurrentBranch updateInstead
end
