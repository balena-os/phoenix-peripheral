#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

LED_ON=1
LED_OFF=0

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR2)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP2=$CHIP_BASE
fi

wifi_led_set(){
    echo "$LED_WIFI_CHIP $LED_WIFI_PIN"
    case $1 in
    on|ON)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $WIFI_LED_PIN $LED_ON
        ;;
    off|OFF)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $WIFI_LED_PIN $LED_OFF
        ;;
    *)  echo "Invalid parameter,only on or off"
        ;;
    esac

}

wifi_led_set $1