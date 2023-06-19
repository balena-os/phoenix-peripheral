#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

USB_ENABLE=1
USB_DISABLE=0

CHIP_BASE=$($COMMON_PATH/gpiochip-get $GPIO_EXPANSION_ADDR1)
if [ "$CHIP_BASE" != "-1" ];then
    GPIO_EXPANSION_CHIP1=$CHIP_BASE
fi

usb_en(){
    case $1 in 
    enable|ENABLE)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $USB_ENABLE_PIN $USB_ENABLE
        ;;
    disable|DISABLE)
        $COMMON_PATH/gpio-control $GPIO_EXPANSION_CHIP1 $USB_ENABLE_PIN $USB_DISABLE
        ;;
    *)  echo "Invalid parameter,only enable or disable"
        ;;
    esac
}

usb_en $1