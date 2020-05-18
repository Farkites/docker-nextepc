#!/bin/sh

echo setting machines

docker exec -dit ue1 tshark -i tun_srsue -a duration:$1 -w ue1-tun_srsue.pcap
docker exec -dit enb tshark -i eth0 -a duration:$1 -w enb-eth0.pcap
docker exec -dit hss tshark -i eth0 -a duration:$1 -w hss-eth0.pcap
docker exec -dit pgw tshark -i eth0 -a duration:$1 -w pgw-eth0.pcap
docker exec -dit pgw tshark -i pgwtun -a duration:$1 -w pgw-pgwtun.pcap
docker exec -dit sgw tshark -i eth0 -a duration:$1 -w sgw-eth0.pcap
docker exec -dit pcrf tshark -i eth0 -a duration:$1 -w pcrf-eth0.pcap
docker exec -dit mme tshark -i eth0 -a duration:$1 -w mme-eth0.pcap

echo capturing traffic for $1 seconds
sleep $(($1+5))

docker cp ue1:root/ue1-tun_srsue.pcap ./capture
docker cp enb:root/enb-eth0.pcap ./capture
docker cp hss:hss-eth0.pcap ./capture
docker cp pgw:pgw-eth0.pcap ./capture
docker cp pgw:pgw-pgwtun.pcap ./capture
docker cp sgw:sgw-eth0.pcap ./capture
docker cp pcrf:pcrf-eth0.pcap ./capture
docker cp mme:mme-eth0.pcap ./capture

chmod 666 capture/*.pcap
