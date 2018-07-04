function _module_py
    /usr/bin/python -c "
import os, subprocess, sys

os.environ['ADIM_PATH_TO_MODULES'] = '/usr/cadtools/bin/modules.dir'
oldenv = dict(os.environ)

cmd = ['/usr/cadtools/bin/modules.dir/module', 'python'] + sys.argv[1:]
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
commands, _ = proc.communicate()

stdout = sys.stdout
sys.stdout = sys.stderr
exec commands
sys.stdout = stdout

for k, v in os.environ.iteritems():
    if v != oldenv.get(k):
        print 'setenv %s \"%s\";' % (k, v)

for k in oldenv:
    if k not in os.environ:
        print 'set -e %s;' % k
" $argv
end

function local_setup
    function module
        eval (_module_py $argv)
    end
    set -gq NVIM_LISTEN_ADDRESS; and module add editerm_wrapper
    alias open xdg-open
end
