###################################################################
# File Name: installall.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年05月10日 星期五 13时56分46秒
#=============================================================
#!/bin/bash

function startcastserver
{
	adb -s $1 shell am start mythware.castbox.server
}
#target="192.168.0.57:5555"
#echo "install $target"
# adb -s $target install -r $1 ; startcastserver $target
#target="192.168.0.57:5556"
#echo "install $target"
# adb -s $target install -r $1; startcastserver $target 
#wait

function installapp
{
	echo "install $1 begin"
	adb -s $1 install -r $2; startcastserver $1
	echo "install $1 ok"
}
echo "done"
for(( i = 1; i < 3; i++ ))  

do  

{  
	if [[ $i == 1 ]]; then
		target="192.168.0.57:5555"
        installapp $target $1
	fi

	if [[ $i == 2 ]]; then
		target="192.168.0.57:5556"
        installapp $target $1
	fi
	
}&  

done  

wait  


