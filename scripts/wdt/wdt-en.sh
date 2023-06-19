#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

WDT_ENABLE=1
WDT_DISABLE=0

wdt_en(){
    case $1 in 
    enable|ENABLE)
        $COMMON_PATH/gpio-control $GPIO_BASE_CHIP $WDT_ENABLE_PIN $WDT_ENABLE
        ;;
    disable|DISABLE)
        $COMMON_PATH/gpio-control $GPIO_BASE_CHIP $WDT_ENABLE_PIN $WDT_DISABLE
        ;;
    *)  echo "Invalid parameter,only enable or disable"
        ;;
    esac
}

wdt_en $1