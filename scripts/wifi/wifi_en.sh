#!/bin/sh

CON_NAME=$(nmcli c | grep AP | awk '{print $1}')
IFACE=$(nmcli c | grep AP | awk '{print $3}')

if [ $IFACE = "--" ]; then
    echo "Don't find WiFi interface"
    exit 1
fi

if [ $1 = "up" ];then
    STATE=$1
elif [ $1 = "down" ];then
    STATE=$1
else 
    echo "Invalid parameter,only up or down"
    STATE=down
    exit 1
fi

nmcli connection $STATE $CON_NAME
exit 0