#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

RF_ENABLE=0
RF_DISABLE=1

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR1)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP1=$CHIP_BASE
fi

rf_bl_ctrl(){
    case $1 in 
    enable|ENABLE)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $RF_BL_PIN $RF_ENABLE
        ;;
    disable|DISABLE)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $RF_BL_PIN $RF_DISABLE
        ;;
    *)  echo "Invalid parameter,only enable or disable"
        ;;
    esac
}

rf_bl_ctrl $1