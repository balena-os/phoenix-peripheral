#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

RELAY_ON=0
RELAY_OFF=1

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR1)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP1=$CHIP_BASE
fi

relay_set(){
    local relay_pin
    case $1 in
    1)
        relay_pin=$RELAY1_PIN
        ;;
    2)
        relay_pin=$RELAY2_PIN
        ;;
    *)  echo "Invalid relay number"
        ;;
    esac

    case $2 in
    on|ON)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $relay_pin $RELAY_ON
        ;;
    off|OFF)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $relay_pin $RELAY_OFF
        ;;
    *)  echo "Invalid parameter,only on or off"
        ;;
    esac
}

relay_set $1 $2