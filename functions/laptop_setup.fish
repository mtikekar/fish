function laptop_setup
    set -gx HOSTNAME (hostname)
    module use /usr/share/modules/modulefiles
    use use.own
    use dotlocal
    use python
    use tigervnc
end
