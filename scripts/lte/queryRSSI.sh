#!/bin/sh

ROOTF_PATH=$(dirname $(dirname $0))
LED_4G_PATH=${ROOTF_PATH}/led/led-4g.sh
#RSSI_FILE=rssi-data
#RSSI_LEVEL=
#LEVEL1=0
#LEVEL2=20
#LEVEL3=40
#LEVEL4=60

get_rssi(){
    rssi=$(mmcli -m $mode | grep signal | sed -e "s/.*: //" | \
            sed -e "s/%.*//")

    echo $rssi

    # if [ $rssi = "" ];then
    #     rssi=0
    # fi

    # if [ $rssi -le $LEVEL1 ];then
    #     RSSI_LEVEL=0

    # elif [ $rssi -lt $LEVEL2 || \
    #         $rssi -gt $LEVEL1 ];then
    #     RSSI_LEVEL=1

    # elif [ $rssi -lt $LEVEL3 || \
    #         rssi -ge $LEVEL2 ];then
    #     RSSI_LEVEL=2

    # elif [ $rssi -lt $LEVEL4 || \
    #         $rssi -ge $LEVEL3 ];then
    #     RSSI_LEVEL=3

    # elif [ $rssi -gt $LEVEL4 ];then
    #     RSSI_LEVEL=4

    # else
    #     RSSI_LEVEL=
    # fi
}

mode=$(mmcli --list-modems | grep QUECTEL | cut -d / -f 6 | cut -c 1)

get_rssi
# LED_4G_PATH ${RSSI_LEVEL}

