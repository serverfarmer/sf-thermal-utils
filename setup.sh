#!/bin/sh

/opt/farm/scripts/setup/extension.sh sf-cache-utils

# QNAP with QTS replaced with Debian
# https://www.cyrius.com/debian/kirkwood/qnap/
if [ "`grep Hardware /proc/cpuinfo |grep QNAP`" != "" ] && [ -f /etc/debian_version ] && [ ! -f /var/cache/cacti/qcontrol.tmp ]; then
	echo "error: you have to patch qcontrol configuration first, using patch file support/qnap-debian/qcontrol.patch" >/var/cache/cacti/qcontrol.tmp
fi

# https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1079544
if grep -q "ProLiant MicroServer Gen8" /sys/class/dmi/id/product_name && [ -d /etc/sensors.d ]; then
	echo "setting up HP ProLiant ACPI fix"
	install_copy /opt/farm/ext/thermal-utils/support/hp-proliant-acpi/hp-acpi-fix.conf /etc/sensors.d/hp-acpi-fix.conf
fi
