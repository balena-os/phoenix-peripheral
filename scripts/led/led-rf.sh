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

rf_led_set(){
    case $1 in
    off|OFF)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_G $LED_OFF
        ;;
    r|R)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_G $LED_OFF
        ;;
    g|G)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_G $LED_ON
        ;;
    rg|RG)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP2 $RF_LED_PIN_G $LED_ON
        ;;
    *)  echo "Invalid parameter,only r,g,rg,off or R,G,RG,OFF"
        ;;
    esac
}

rf_led_set $1