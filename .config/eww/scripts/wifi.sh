#!/usr/bin/env bash

# grab display env from the running i3 session
# export DISPLAY="${DISPLAY:-:0}"
# eval $(grep -z DBUS_SESSION_BUS_ADDRESS \
#     /proc/$(pgrep -u "$USER" i3 | head -1)/environ \
#     | tr '\0' '\n')

chosen=$(
    nmcli -t -f SSID dev wifi | sed '/^$/d' | uniq | rofi -dmenu -i -p "WiFi"
)
[ -z "$chosen" ] && exit
nmcli device wifi connect "$chosen"
