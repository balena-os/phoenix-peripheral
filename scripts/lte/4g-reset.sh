#!/bin/sh

TMP_PATH=$(dirname $(dirname $0))
COMMON_PATH=$TMP_PATH/common

. $COMMON_PATH/phoenix_gpio.conf

GPIO_HIGH=1
GPIO_LOW=0

lte_reset(){
    $COMMON_PATH/gpio-control $GPIO_BASE_CHIP $LTE_PWR_PIN $GPIO_HIGH
    sleep 0.5
    $COMMON_PATH/gpio-control $GPIO_BASE_CHIP $LTE_PWR_PIN $GPIO_LOW
}

lte_reset