# Phoenix peripheral services

## GPIO WDT

gpio-wdt.service is enabled by default.Don't disable gpio-wdt.service.



## RTC

rtc-sync.service is enabled by default.

- Enable RTC function Manually 

```shell
sudo systemctl enable rtc-sync.service
sudo systemctl start rtc-sync.service
```

- Disable RTC function Manually 

```shell
sudo systemctl stop rtc-sync.service
sudo systemctl disable rtc-sync.service
```