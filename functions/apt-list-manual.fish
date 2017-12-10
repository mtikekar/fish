function apt-list-manual
    comm -23 (apt-mark showmanual | sort -u | psub) (gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u | psub )
end
