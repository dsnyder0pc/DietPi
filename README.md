# DietPi
DietPi scripts that I've hacked together for various purposes

## dietpi-setup | `Configure Raspberry Pi DietPi microSD card for Roon`

The goal with this script is to enable a Roon subscriber to easily transform a standard Raspberry Pi into a network audio transport that can drive a USB DAC. This allows any USB DAC to show up on your home network as a Roon Output. DietPi makes this super easy to do, but some folks struggle with getting Wi-Fi and the audio settings configured, so I wrote this script to simplify the process.

Here's an example of what running it looks like on macOS after flashing a fresh microSD card with the latest Raspberry Pi DietPi image using etcher:

```
$ cd /Volumes/boot/
$ curl -LO ws-e.com/dietpi-setup
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   295  100   295    0     0    885      0 --:--:-- --:--:-- --:--:--   885
100  6875  100  6875    0     0  10448      0 --:--:-- --:--:-- --:--:-- 68069
$ perl ./dietpi-setup

---------------------------------------------------------
-  This will edit dietpi.txt for your home network.
-  At each prompt below, type the information requested
   and then hit [enter] or [return].

- Name your RPi (only letters, numbers and dashes): roon-usb
- Do you have a wifi network? (y/n) : y
- Your wifi SSID: Audiophiles
- Your wifi password: ************

- Settings updated in dietpi.txt:
    AUTO_SETUP_NET_ETHERNET_ENABLED = 0
                    SURVEY_OPTED_IN = 0
       CONFIG_BOOT_WAIT_FOR_NETWORK = 2
         CONFIG_G_CHECK_URL_TIMEOUT = 300
       CONFIG_SERIAL_CONSOLE_ENABLE = 0
            AUTO_SETUP_NET_HOSTNAME = roon-usb
                  AUTO_SETUP_LOCALE = en_US.UTF-8
            CONFIG_CHECK_DNS_DOMAIN = localhost
         CONFIG_CHECK_CONNECTION_IP = 127.0.0.1
    AUTO_SETUP_NET_WIFI_COUNTRY_CODE = US
               AUTO_SETUP_AUTOMATED = 1
                   CONFIG_SOUNDCARD = usb-dac
        AUTO_SETUP_NET_WIFI_ENABLED = 1
        CONFIG_G_CHECK_URL_ATTEMPTS = 5
     AUTO_SETUP_INSTALL_SOFTWARE_ID = 5,121
         AUTO_SETUP_KEYBOARD_LAYOUT = us
                AUTO_SETUP_TIMEZONE = America/Los_Angeles

!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!
- Some settings not found in dietpi.txt:
    CONFIG_WIFI_COUNTRY_CODE
!!!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!

- Updates to dietpi.txt saved.

- Settings updated in dietpi-wifi.txt:
                        WIFI_KEYMGR = 'WPA-PSK'
                          WIFI_SSID = 'Audiophiles'
                           WIFI_KEY = '************'
- Updates to dietpi-wifi.txt saved.
```

If you see the `CONFIG_WIFI_COUNTRY_CODE` warning, you can ignore it for now. I'll remove this once legacy support for the January 26th build of DietPi for RPi on ARMv6 is no longer required.

After doing this, eject the microSD card, shove it into the Raspberry Pi, and add power. It's not necessary to attach a display to the Raspberry Pi, but if you did, this is an example of what you might see: https://youtu.be/4g6YxaAaG_A?t=855

More details here: https://docs.google.com/document/d/1QOBJoIwk48TFuAgFWJn25vjGTBNifXfScoVXJnBBEyY/edit?usp=sharing

Make sure that your USB DAC is connected to the Raspberry Pi and powered on. If all goes well, you should find your new output hiding under the Audio settings of Roon. Enable it and click on the gear to verify the settings. It will now show up in your list of output zones. Enjoy some music.
