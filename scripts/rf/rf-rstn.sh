#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

GPIO_HIGH=1
GPIO_LOW=0

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR3)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP3=$CHIP_BASE
fi

rf_rstn(){
    $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $RF_RSTN_PIN $GPIO_LOW
    sleep 0.5
    $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $RF_RSTN_PIN $GPIO_HIGH
}

rf_rstn
