###################################################################
# File Name: startapk.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2017年06月21日 星期三 15时15分29秒
#=============================================================
#!/bin/bash

if [ ! -n "$1" ]
	then

	echo "am start"
	for((i=1;i<100;i++))
	do
		adb shell am start -n mythware.classroom.teacher/mythware.ux.teacher.form.MainActivity > tmp
		sleep 1
		ret=`cat tmp | head -1`
	    if [ -n "$ret" ]
			then
			strB="Starting"
	    	if [[ $ret == *$strB* ]]
	    	    then
				echo Success

				break
			else
				echo Failed
			fi
		fi
		rm tmp
	done
	sleep 8
fi
	echo "input tap 732 392"
	adb shell input tap 732 392
	sleep 2
	echo "input tap 788 491"
	adb shell input tap 788 491
