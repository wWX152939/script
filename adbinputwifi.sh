###################################################################
# File Name: adbinputwifi.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年08月08日 星期四 14时22分46秒
#=============================================================
#!/bin/bash

tab=61
function start()
{

	adb -s $1 shell input text $2; adb -s $1 shell input keyevent $tab; adb -s $1 shell input keyevent $tab; adb -s $1 shell input text $3;
	adb -s $1 shell input keyevent $tab; adb -s $1 shell input keyevent $tab; adb -s $1 shell input keyevent $tab; adb -s $1 shell input keyevent $tab; adb -s $1 shell input keyevent 66; 
}

start $adbserver ClassroomCloud-014A 12345678
