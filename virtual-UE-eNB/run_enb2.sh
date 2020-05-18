#!/bin/sh
sleep 10
srsenb /config/enb.conf.fauxrf --enb.name=dummyENB02 --enb.mcc=001 --enb.mnc=01 --enb.enb_id=18AF2 --enb.tac=0x0001 --enb.cell_id=02 --enb.mme_addr=192.168.26.20 --enb.gtp_bind_addr=192.168.26.70 --enb.s1c_bind_addr=192.168.26.70 --enb_files.rr_config=/config/rr.conf --enb_files.sib_config=/config/sib.conf --enb_files.drb_config=/config/drb.conf
