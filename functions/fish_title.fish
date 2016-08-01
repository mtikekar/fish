function fish_title
    echo $_'@'
    hostname
    echo :
    pwd | string replace $HOME '~'
end
