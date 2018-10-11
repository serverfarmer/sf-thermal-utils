#!/bin/sh

file=`mktemp -u /var/cache/cacti/sensors.XXXXXXXXX.tmp`
sensors >$file

acpi="`grep \"temp1:\" $file |head -n1 |sed s/[+C°]//g |awk \"{ print \\\$2 }\"`"

core0="`grep \"Core 0:\" $file |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core1="`grep \"Core 1:\" $file |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core2="`grep \"Core 2:\" $file |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"
core3="`grep \"Core 3:\" $file |sed s/[+C°]//g |awk \"{ print \\\$3 }\"`"

rm -f $file

if [ "$acpi" = "" ]; then acpi=0; fi

if [ "$core0" = "" ]; then core0=0; fi
if [ "$core1" = "" ]; then core1=0; fi
if [ "$core2" = "" ]; then core2=0; fi
if [ "$core3" = "" ]; then core3=0; fi

echo "acpitz:$acpi core0:$core0 core1:$core1 core2:$core2 core3:$core3"
