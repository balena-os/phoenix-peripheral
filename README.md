# README.md

There have three folders
- application: include *.c file and Makefile
- scripts: include shell scripts
- systemd: include systemd service

## Folders Tree

### application
Phoenix Button test application based on libgpiod.
```sh
application/
└── button
    ├── button.c
    └── Makefile
```

### scripts
Phoenix peripheral test script.
```sh
scripts/
├── button
│   ├── button_bt.sh
│   ├── button_rf.sh
│   ├── button_rst.sh
│   └── button_wifi.sh
├── buzzer
│   └── buzzer.sh
├── common
│   ├── gpio-control
│   └── phoenix_gpio.conf
├── led
│   ├── led-4g.sh
│   ├── led-bt.sh
│   ├── led-cloud.sh
│   ├── led-general.sh
│   ├── led-rf.sh
│   └── led-wifi.sh
├── lte
│   ├── 4g-reset.sh
│   └── queryRSSI.sh
├── README.md
├── relay
│   └── relay.sh
├── rf
│   ├── rf-bl.sh
│   └── rf-pwr.sh
├── rst
│   └── restart.sh
├── usb
│   └── usb-en.sh
├── wdt
│   └── wdt-en.sh
└── wifi
    └── wifi_en.sh
```

### systemd
```sh
systemd/
├── gpio-wdt.service
└── rtc-sync.service
```
**gpio-wdt.service**:watchdog auto-enable service when OS start.

**rtc-sync.service**: RTC auto sync time when OS start.