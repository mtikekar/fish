function networks
    set -l order (networksetup -listnetworkserviceorder | grep -oP '^\(\d+\) \K.*')
    if [ (count $argv) -eq 0 ]
        printf '%s\n' $order
        return
    end
    set -l net
    switch $argv[1]
        case wifi
            set net Wi-Fi
        case eth
            set net 'USB 10/100/1000 LAN'
        case '*'
            echo 'usage: networks [wifi|eth]'
            return
    end
    set -l net_idx (contains -i $net $order)
    [ $net_idx -eq 1 ]; and return
    set -e order[$net_idx]
    set order $net $order
    sudo networksetup -ordernetworkservices $order
end
