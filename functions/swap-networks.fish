function swap-networks
    set -l order (networksetup -listnetworkserviceorder | grep -oP '(?<=^\(\d\) ).*')
    set -l wifi (contains -i Wi-Fi $order)
    set -l eth (contains -i 'USB 10/100/1000 LAN' $order)
    set -l new_order $order
    set new_order[$wifi] $order[$eth]
    set new_order[$eth] $order[$wifi]
    sudo networksetup -ordernetworkservices $new_order
end
