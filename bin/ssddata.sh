#!/bin/bash
export LC_TIME=zh_CN.UTF-8
date >> /var/log/ssd.log
/usr/sbin/smartctl -A /dev/nvme0n1 | sed -n '10,12p;16,18p' >> /var/log/ssd.log
