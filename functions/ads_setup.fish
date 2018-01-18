function _module_py
    /usr/bin/python -c "
import os, subprocess, sys, string

class MyEnv(dict):
    def __setitem__(self, key, val):
        super(MyEnv, self).__setitem__(key, val)
        print('setenv %s \"%s\"' % (key, val))

os.environ['ADIM_PATH_TO_MODULES'] = '/usr/cadtools/bin/modules.dir'
os.environ = MyEnv(os.environ)
cmd = ['/usr/cadtools/bin/modules.dir/module', 'python'] + sys.argv[1:]
proc = subprocess.Popen(cmd, stdout=subprocess.PIPE)
commands, _ = proc.communicate()
exec commands
" $argv
end

function ads_setup
    function module
        for v in (_module_py $argv)
            eval $v
        end
    end
end
