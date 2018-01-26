#!/bin/bash
interface=$(iwconfig | grep IEEE | cut -d ' ' -f 1 2> /dev/null)
freq=5.22G

echo will work on interface $interface
systemctl stop NetworkManager.service

echo $interface details
iwconfig $interface

ip link set dev $interface down

iwconfig $interface mode monitor
ip link set dev $interface up

echo $interface details
iwconfig $interface
iwconfig $interface freq $freq

tcpdump -i $interface -A -l -n 
#tcpdump -i $interface -A -l -n -v tcp and port 80 #| grep -i password -A3 -B3
