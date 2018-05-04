function backup --description 'Create copy of dirs suffixed with current time'
    set -l suffix (date +"%F_%R")
    for i in $argv
     echo cp -a $i (basename $i).$suffix
     cp -a $i (basename $i).$suffix
   end
end
