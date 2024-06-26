#!/usr/bin/env bash
{
if command -v nmcli >/dev/null 2>&1 ; then
nmcli radio all off
else
if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
mname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless
| xargs -0 dirname); do basename "$(readlink -f
"$driverdir"/device/driver/module)";done | sort -u)
for dm in $mname; do
echo "install $dm /bin/true" >> /etc/modprobe.d/disable_wireless.conf
done
fi
fi
}