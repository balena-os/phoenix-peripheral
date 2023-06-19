#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

LED_ON=1
LED_OFF=0

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR3)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP3=$CHIP_BASE
fi

general_led_set(){
    case $1 in
    off|OFF)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_OFF
        ;;
    r|R)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_OFF
        ;;
    g|G)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_OFF
        ;;
    b|B)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_ON
        ;;
    rg|RG)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_OFF
        ;;
    rb|RB)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_ON
        ;;
    gb|GB)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_OFF
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_ON
        ;;
    rgb|RGB)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_R $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_G $LED_ON
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP3 $GENERAL_LED_PIN_B $LED_ON
        ;;
    *)  echo "Invalid parameter,only r/g/b,off or R/G/B,OFF"
        ;;
    esac
}

general_led_set $1