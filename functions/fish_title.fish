function fish_title
    echo $_':'
    pwd | string replace $HOME '~'
end
