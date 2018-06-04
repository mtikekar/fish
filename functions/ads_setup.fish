function _module_py
    /usr/bin/python -c "
import os, subprocess, sys

class MyEnv(dict):
    def __setitem__(self, key, val):
        super(MyEnv, self).__setitem__(key, val)
        print 'setenv %s \"%s\"' % (key, val)

    def has_key(self, key):
        return False if key == 'ADIM_WARNINGS' else super(MyEnv, self).has_key(key)

os.environ['ADIM_PATH_TO_MODULES'] = '/usr/cadtools/bin/modules.dir'
os.environ = MyEnv(os.environ)
cmd = ['/usr/cadtools/bin/modules.dir/module', 'python'] + sys.argv[1:]
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
commands, _ = proc.communicate()
exec commands
if dict.has_key(os.environ, 'ADIM_WARNINGS'):
    sys.stderr.write(os.environ['ADIM_WARNINGS'].replace('#', '\n'))
" $argv
end

function local_setup
    function module
        for v in (_module_py $argv)
            eval $v
        end
    end
end
