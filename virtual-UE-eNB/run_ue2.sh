#!/bin/sh
sleep 10
bash route_ue.sh &
srsue /config/ue.conf.fauxrf --usim.imsi=001010000000002 --usim.k=c8eba87c1074edd06885cb0486718342 --usim.algo=milenage --usim.opc=17b6c0157895bcaa1efc1cef55033f6f --nas.apn=internet
