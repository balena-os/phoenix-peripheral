# Phoenix peripheral scripts

## Usage of script

### buzzer

- turn on the buzzer
```shell
    ./buzzer/buzzer.sh on
```

- turn off the buzzer
```shell
    ./buzzer/buzzer.sh off
```

### LED

#### 4G LTE LED

LED has five modes
- Turn off all 4G leds
```shell
    ./led/led-4g.sh off
```

- Turn on one 4G led with green
```shell
    ./led/led-4g.sh g 1
```

- Turn on one 4G led with red
```shell
    ./led/led-4g.sh r 1
```

- Turn on one 4G led with yellow
```shell
    ./led/led-4g.sh rg 1
```

- Turn on two 4G leds with green
```shell
    ./led/led-4g.sh g 2
```

- Turn on three 4G leds with green
```shell
    ./led/led-4g.sh g 3
```

- Turn on all 4G leds with green
```shell
    ./led/led-4g.sh g 4
```

#### Bluetooth LED

- Turn on BT led
```shell
    ./led/led-bt.sh on
```

- Turn off BT led
```shell
    ./led/led-bt.sh off
```

#### Cloud LED

- green led display
```shell
    ./led/led-cloud.sh g
```

- red led display
```shell
    ./led/led-cloud.sh r
```

- yellow led display
```shell
    ./led/led-cloud.sh rg
```

#### General LED
- Turn off all leds
```shell
    ./led/led-general.sh off
```

- Turn on the red led
```shell
    ./led/led-general.sh r
```

- Turn on the green led
```shell
    ./led/led-general.sh g
```

- Turn on the blue led
```shell
    ./led/led-general.sh b
```

- Turn on the red and green led
```shell
    ./led/led-general.sh rg
```

- Turn on the red and blue led
```shell
    ./led/led-general.sh rb
```

- Turn on the blue and green led
```shell
    ./led/led-general.sh bg
```

- Turn on all leds
```shell
    ./led/led-general.sh rgb
```

#### RF LED
- Turn off all leds
```shell
    ./led/led-rf.sh off
```

- Turn on red led
```shell
    ./led/led-rf.sh r
```

- Turn on green led
```shell
    ./led/led-rf.sh g
```

- Turn on yellow leds
```shell
    ./led/led-rf.sh rg
```

#### WiFi LED
- Turn on WiFi led
```shell
    ./led/led-wifi.sh on
```

- Turn off WiFi led
```shell
    ./led/led-wifi.sh off
```

### Reset 4G module
```shell
    ./lte/4g-reset.sh
```

### Query 4G LTE RSSI

```shell
    ./lte/queryRSSI.sh
```

### Relay

- Turn on relay1
```shell
    ./relay/relay.sh 1 on
```

- Turn off relay1
```shell
    ./relay/relay.sh 1 off
```

- Turn on relay2
```shell
    ./relay/relay.sh 2 on
```

- Turn off relay2
```shell
    ./relay/relay.sh 2 off
```

### RF 

- Enablle RF bootloader mode
```shell
    ./rf/rf-bl.sh enable
```

- Disable RF bootloader mode
```shell
    ./rf/rf-bl.sh disable
```

- Enablle RF power
```shell
    ./rf/rf-pwr.sh enable
```

- Disable RF power
```shell
    ./rf/rf-pwr.sh disable
```

- Reset RF module
```shell
    ./rf/rf-rstn.sh
```

### Cold Restart

```sh
    ./rst/restart.sh
```

### USB

- Enable USB
```shell
    ./usb/usb-en.sh enable
```

- Disable USB
```shell
    ./usb/usb-en.sh disable
```

### WDT

- Enable wdt
```shell
    ./wdt/wdt-en.sh enable
```

- Disable wdt
```shell
    ./wdt/wdt-en.sh disable
```

### WiFi AP Control
Super user permission is required to execute this script,so add sudo prefix.

- WiFi AP up
```shell
    sudo ./wifi/wifi_en.sh up
```

- WiFi AP down
```shell
    sudo ./wifi/wifi_en.sh down
```