###################################################################
# File Name: export.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2018年04月26日 星期四 17时21分21秒
#=============================================================
#!/bin/bash
tmp='./ttttt111'
#apkpath='mythware.castbox.controller'
apkpath='mythware.castbox.server'
sdcardpath='/sdcard/Android/data/'$apkpath'/files/'
#echo $sdcardpath
phone=$adbserver
if [ ! -n "$1" ]
    then
	echo $phone
else
	if [ $1 == "360" ] 
		then
		phone="YTSKDQHQT4ZTWSRS"
	elif [ $1 == "htc" ]
		then
		phone="HT4B6JT04415"
	elif [ $1 == "huawei" ]
		then
		phone="CJL0216913005590"

	elif [ $1 == "padhuawei" ]
		then
		phone="TJF4C15806003673"
	else
		phone=$1
	fi
		
	echo $phone
fi

#adb shell ls  $sdcardpath/crash-* | tail -n 1 > $tmp
adb -s $phone shell ls  $sdcardpath/crash-* | tail -n 1 > $tmp
dos2unix $tmp
filename=`cat $tmp`
#echo $filename
filepath=$filename
echo "$filepath"
#adb shell cat "$filepath"
adb -s $phone shell cat "$filepath"
rm $tmp
