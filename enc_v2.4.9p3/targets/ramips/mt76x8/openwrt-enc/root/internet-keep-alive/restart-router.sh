#!/bin/sh
# This file is responsible for restarting the router using reboot command.
# There is a stratery to write few lines into the log, so that grepping last lines
# returns less occurences of word OFFLINE. Too many occurences actually run this script.

DIR=$( cd $(dirname $0) ; pwd -P )
LOG_FILE="$DIR/log.txt"

echo "$(date) > TOO MANY OFFLINE TRYOUTS" >> $LOG_FILE
echo "$(date) > GOING TO REBOOT 4G MODEM" >> $LOG_FILE
echo "$(date) > NOW!" >> $LOG_FILE
echo "$(date) > SORRY FOR ANY INCONVENIENCE." >> $LOG_FILE

echo "SH REBOOT"

# Send AT+CFUN=1,1 to AT
echo -e "AT+CFUN=0\r\n" > /dev/ttyUSB2
sleep 5
echo -e "AT+CFUN=1,1\r\n" > /dev/ttyUSB2
sleep 5

# Reboot 4G modem
# killall uqmi || echo "UQMI works fine!"
# timeout 1 uqmi -d /dev/cdc-wdm0 --set-device-operating-mode offline
# timeout 1 uqmi -d /dev/cdc-wdm0 --set-device-operating-mode reset