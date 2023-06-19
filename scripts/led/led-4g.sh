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

green_led_level(){
    case $1 in
    1)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_G} $LED_OFF
        ;;
    2)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_G} $LED_OFF
        ;;
    3)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_G} $LED_OFF
        ;;
    4)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_G} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_G} $LED_ON
        ;;
    0)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_G} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_G} $LED_OFF
        ;;
    *)  echo "Invalid level number"
        ;;
    esac
}

red_led_level(){
    case $1 in
    1)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_R} $LED_OFF
        ;;
    2)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_R} $LED_OFF
        ;;
    3)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_R} $LED_OFF
        ;;
    4)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_R} $LED_ON
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_R} $LED_ON
        ;;
    0)
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED1_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED2_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED3_PIN_R} $LED_OFF
        $COMMON_PATH/gpio-control ${GPIO_EXPANSION_CHIP2} ${LTE_LED4_PIN_R} $LED_OFF
        ;;
    *)  echo "Invalid level number"
        ;;
    esac
}

lte_led_set(){
    case $1 in
    off|OFF)
        green_led_level 0
        red_led_level 0
        ;;
    r|R)
        green_led_level 0
        red_led_level $2
        ;;
    g|G)
        red_led_level 0
        green_led_level $2
        ;;
    rg|RG)
        red_led_level $2
        green_led_level $2
        ;;
    *)  echo "Invalid parameter,only r,g,rg,off or R,G,RG,OFF"
        ;;
    esac
}

lte_led_set $1 $2