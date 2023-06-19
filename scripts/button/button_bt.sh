#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
LED_PATH=${TMP_PATH}/led

$LED_PATH/led-bt.sh $1

exit 0