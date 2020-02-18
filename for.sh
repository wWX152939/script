###################################################################
# File Name: for.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年05月29日 星期三 17时27分44秒
#=============================================================
#!/bin/bash
for i in $(seq 1 100)  
do   
	echo $i  
	adb shell ifconfig eth0 down
	sleep 1
	adb shell ifconfig eth0 up
	sleep 5
done   
