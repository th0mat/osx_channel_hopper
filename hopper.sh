#!/bin/bash

# channel hopping script for osx
# needs to be run with root
#
# IN ORDER FOR THIS TO WORK you need to first put airport into your path
#    this is best done by symlinking it as follows
#       ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport /usr/local/bin
#    the path might chance with different os versions
#    confirm that it worked:
#       airport -I
#    this should give you the airport status (e.g. which channel it is on)
#
########################################################################################################



# hopper settings
IFACE="en0"
CHANNELS="1 2 3 4 5 6 7 8 9 10 11"
SECS_TO_REMAIN_ON_CHANNEL=0.05


# return the interface to a status ready for associations after the script
# is stopped with ctrl-c
trap ctrl_c INT
function ctrl_c() {
   ifconfig en0 up
   exit 2
}


# disassociate from associated BSSID (required to change channel setting)
airport -z


# start hopping
while true ; do
   for CHANNEL in $CHANNELS ; do
      airport $IFACE -c$CHANNEL
      sleep $SECS_TO_REMAIN_ON_CHANNEL
   done
done
