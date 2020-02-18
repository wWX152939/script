###################################################################
# File Name: installall.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年05月10日 星期五 13时56分46秒
#=============================================================
#!/bin/bash
path=/media/truecrypt32/git/CastServer/bin/CastServer6.apk

function installall()
{
	alldevices=`adb devices | awk '{print $1}'`
	j=0
	for i in $alldevices ; do
		let j=j+1
		if [[ $j -gt 1 ]];then
		echo getprop $i
		adb -s $i shell getprop | grep sn
		fi
	done

}	

if [ ! -n "$1" ] ; then
	echo path is $path
	installall
else
	echo path is $1
	path=$1
	installall
fi
#echo "install 192.168.0.57:6002"
#adb -s 192.168.0.57:6002 install -r $path ;
#echo "install 192.168.0.57:6001"
#adb -s 192.168.0.57:6001 install -r $path ;
#echo "install 192.168.0.57:5555"
#adb -s 192.168.0.57:5555 install -r $path ;
#echo "install 192.168.0.57:5556"
#adb -s 192.168.0.57:5556 install -r $path ;
