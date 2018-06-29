#!/bin/sh

t="/var/cache/cacti/sensors.tmp"
rm -f $t
sensors >$t

acpi="`grep \"temp1:\" $t |head -n1 |sed s/[+C°]//g |awk \"{ print \\\$2 }\"`"

core0="`grep \"Core 0:\" $t |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core1="`grep \"Core 1:\" $t |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core2="`grep \"Core 2:\" $t |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core3="`grep \"Core 3:\" $t |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"

if [ "$acpi" = "" ]; then acpi=0; fi

if [ "$core0" = "" ]; then core0=0; fi
if [ "$core1" = "" ]; then core1=0; fi
if [ "$core2" = "" ]; then core2=0; fi
if [ "$core3" = "" ]; then core3=0; fi

echo "acpitz:$acpi core0:$core0 core1:$core1 core2:$core2 core3:$core3"
