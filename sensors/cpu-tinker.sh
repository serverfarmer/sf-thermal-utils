#!/bin/sh

sensor0=`cat /sys/class/thermal/thermal_zone1/temp |awk '{ printf("%.1f", $1/1000) }'`
echo "acpitz:0 core0:$sensor0 core1:0 core2:0 core3:0"
