#!/bin/sh
#sleep 20
while [ "$(ip link | wc -l)" -lt "4" ]; do sleep 1; done
sleep 2
route add default tun_srsue
ping -i 10 45.45.0.1
