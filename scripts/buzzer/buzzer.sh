#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

BUZZER_ON=1
BUZZER_OFF=0

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR1)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP1=$CHIP_BASE
fi

buzzer_set(){
    case $1 in
    on|ON)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $BUZZER_PIN $BUZZER_ON
        ;;
    off|OFF)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $BUZZER_PIN $BUZZER_OFF
        ;;
    *)  echo "Invalid parameter,only on or off"
        ;;
    esac
}

buzzer_set $1