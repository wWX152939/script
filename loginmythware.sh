###################################################################
# File Name: login.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年04月01日 星期一 16时04分58秒
#=============================================================
#!/bin/bash
function login()
{
	adb -s $1 shell input tap 1888 888;adb -s $1 shell input text 13800000000;adb -s $1 shell input keyevent 66;adb -s $1 shell input text Mythware123;adb -s $1 shell input tap 1054 512
}
function loginmythwareid()
{
	
	adb -s $1 shell input text 15850692709;adb -s $1 shell input keyevent 66;adb -s $1 shell input text Mythware123;adb -s $1 shell input tap 1054 512
}

if [ -n "$1" ]
	then
	loginmythwareid $1
	else
	loginmythwareid $adbserver
fi

