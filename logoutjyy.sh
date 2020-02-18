###################################################################
# File Name: login.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年04月01日 星期一 16时04分58秒
#=============================================================
#!/bin/bash

function loginjyy2()
{
	#account="13800000000"
	#pwd="Mythware123"
	#account="15800000000"
	echo logining params $1 $2
	account="15811111111"
	if [ "z" == "$2" ]
		then 
		account="15800000000"
	fi
	pwd="Mythware123"
	adb -s $1 shell input tap 1888 868;adb -s $1 shell input text $account;adb -s $1 shell input keyevent 66;adb -s $1 shell input text $pwd;
	adb -s $1 shell input tap 1054 512
}
function loginmythwareid()
{
	
	adb -s $1 shell input text 15850692709;adb -s $1 shell input keyevent 66;adb -s $1 shell input text Mythware123
}

function selectSchool
{
	adb -s $1 shell input tap 826 437
	adb -s $1 shell input tap 1076 793
}

function enter()
{
	adb -s $1 shell input tap 1220 540
}

function finishClass()
{
	adb -s $1 shell input tap 1888 888
	adb -s $1 shell input tap 1888 888
	adb -s $1 shell input tap 1083 620	
}

function watchmemory()
{
	adb -s $1 shell top -n 1 | grep mythware.castbox.server
}

function main()
{
	adb  shell input tap 1888 888
	adb  shell input tap 1083 620	
}

main
#if [ -n "$1" ]
#	then
#	loginjyy2 $1 $2
#else
#	loginjyy2 $adbserver z
#fi

