function colors --description 'Visual test of colors with set_color'
    set_color 002b36; echo base03    8  #002b36 #1c1c1c
    set_color 073642; echo base02    0  #073642 #262626
    set_color 586e75; echo base01   10  #586e75 #585858
    set_color 657b83; echo base00   11  #657b83 #626262
    set_color 839496; echo base0    12  #839496 #808080
    set_color 93a1a1; echo base1    14  #93a1a1 #8a8a8a
    set_color eee8d5; echo base2     7  #eee8d5 #e4e4e4
    set_color fdf6e3; echo base3    15  #fdf6e3 #ffffd7
    set_color b58900; echo yellow    3  #b58900 #af8700
    set_color cb4b16; echo orange    9  #cb4b16 #d75f00
    set_color dc322f; echo red       1  #dc322f #d70000
    set_color d33682; echo magenta   5  #d33682 #af005f
    set_color 6c71c4; echo violet   13  #6c71c4 #5f5faf
    set_color 268bd2; echo blue      4  #268bd2 #0087ff
    set_color 2aa198; echo cyan      6  #2aa198 #00afaf
    set_color 859900; echo green     2  #859900 #5f8700

    for col in (set_color -c)
        set_color $col; echo $col
    end
end
