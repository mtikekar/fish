function build
    command python -u ~/.local/bin/build.py $argv  | sed -e "s/\bwarning:/\x1b[34m&\x1b[39m/I" -e "s/\berror:/\x1b[31m&\x1b[39m/I" -e "s/\bexec:/\x1b[32m&\x1b[39m/"
end

