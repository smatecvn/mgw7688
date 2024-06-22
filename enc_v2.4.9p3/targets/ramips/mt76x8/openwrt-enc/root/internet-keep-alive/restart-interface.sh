#!/bin/sh
# This file is responsible for restarting the network interface.
# Should be run once OFFLINE state is detected.

INTERFACE="wan"

# syslog entry
logger -s "INTERNET KEEP ALIVE SYSTEM: Restarting the LTE interface."

# Kill all uqmi
killall uqmi || echo "UQMI works fine!"

#timeout 1 uqmi -d /dev/cdc-wdm0 --set-device-operating-mode offline
#timeout 1 uqmi -d /dev/cdc-wdm0 --set-device-operating-mode reset
#sleep 10

# Restart interface
ifdown wan
sleep 2
ifup wan