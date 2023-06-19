#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
SHLLE_PATH=${TMP_PATH}/rf
LED_PATH=${TMP_PATH}/led

if [ $1 = "on" ];then
    status=g
elif [ $1 = "off" ];then
    status=off
fi

$LED_PATH/led-rf.sh $status

exit 0