###################################################################
# File Name: login.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年04月01日 星期一 16时04分58秒
#=============================================================
#!/bin/bash

function login()
{
	#account="13800000000"
	#pwd="Mythware123"
	account=$2
	pwd=$3
	adb -s $1 shell input text $account;adb -s $1 shell input keyevent 66;adb -s $1 shell input text $pwd;adb -s $1 shell input tap 1054 512
}
function loginmythwareid()
{
	
	adb -s $1 shell input text 15850692709;adb -s $1 shell input keyevent 66;adb -s $1 shell input text Mythware123
}

if [ -n "$1" ]
	then
	login $1 $2 $3
	else
	login $adbserver
fi

