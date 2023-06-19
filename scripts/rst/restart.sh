#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

HIGH=1
LOW=0

$COMMON_PATH/gpio-control $GPIO_BASE_CHIP $RST_PIN $HIGH
sleep 0.1
$COMMON_PATH/gpio-control $GPIO_BASE_CHIP $RST_PIN $LOW