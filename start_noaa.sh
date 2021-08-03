#!/bin/sh

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

while :
do
	echo "------ Starting stream ------"
	ezstream -V
	echo "-----------------------------"
	lame --version
	echo "-----------------------------"
	rtl_fm -v
	echo "-----------------------------"
	rtl_fm -f 162.55M -s 48000 -l 0 -d 0 -g 45 | lame -s 48000 --lowpass 3200 --abr 64 --scale 9 -r -m m - - | ezstream -c /etc/ezstream.xml -v
	echo "------ Stream exited --------"
done