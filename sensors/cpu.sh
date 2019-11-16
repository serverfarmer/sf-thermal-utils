#!/bin/sh

# QNAP with QTS replaced with Debian
# https://www.cyrius.com/debian/kirkwood/qnap/
if [ "`grep Hardware /proc/cpuinfo |grep QNAP`" != "" ] && [ -f /etc/debian_version ]; then
	cat /var/cache/cacti/qcontrol.tmp

# QNAP with original QTS firmware
elif [ -f /etc/config/qpkg.conf ]; then
	/opt/farm/ext/thermal-utils/sensors/cpu-qnap-qts.sh

# Raspberry Pi
elif [ -f /etc/rpi-issue ]; then
	/opt/farm/ext/thermal-utils/sensors/cpu-raspi.sh

# NanoPi-NEO2, other SBCs with Allwinner CPU
elif grep -iq allwinner /proc/cpuinfo; then
	/opt/farm/ext/thermal-utils/sensors/cpu-allwinner.sh

# CompuLab Fit-PC2
# http://www.fit-pc.com/web/products/fit-pc2/
# http://www.fit-pc.com/forum/viewtopic.php?f=9&t=401
elif [ "`cat /sys/class/dmi/id/product_name`" = "SBC-FITPC2" ]; then
	/opt/farm/ext/thermal-utils/sensors/cpu-fitpc2.sh

# generic PC using lm-sensors
else
	/opt/farm/ext/thermal-utils/sensors/cpu-sensors.sh
fi
