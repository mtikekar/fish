function bsc
    command bsc $argv 2>| sed -e "s/\bwarning\b/\x1b[34m&\x1b[39m/I" -e "s/\berror\b/\x1b[31m&\x1b[39m/I"
end
