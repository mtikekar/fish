function viman --wraps=man --description 'use vim to view man pages. Ctrl-] to follow link and Ctrl-t to go back'
	vim -R -c "set ft=man" -c "Man $argv"
end
