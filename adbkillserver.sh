###################################################################
# File Name: adbkillserver.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年03月14日 星期四 14时04分13秒
#=============================================================
#!/bin/bash

if [ ! -n "$1" ]
    then
	id=`adb shell ps | grep mythware.castbox.server | awk '{print $2}'`;adb shell kill $id
else
	id=`adb -s $1 shell ps | grep mythware.castbox.server | awk '{print $2}'`;adb -s $1 shell kill $id
fi
