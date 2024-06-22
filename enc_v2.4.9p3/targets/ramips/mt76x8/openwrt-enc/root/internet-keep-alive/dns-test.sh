#!/bin/sh
# This file is responsible for DNS check. The return value of its process
# determines the ONLINE/OFFLINE state.

PACKET_COUNT=4

ONLINE=0

for i in `seq 1 $PACKET_COUNT`;
    do        
        nc -z -w 3 google.com 80 2>/dev/null
        RETVAL=$?
		if [ $RETVAL -eq 0 ]; then
			ONLINE=1
		fi
    done

if [ $ONLINE -eq 1 ]; then
    # ONLINE
    exit 0
else
    # OFFLINE
    exit 1
fi