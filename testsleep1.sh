###################################################################
# File Name: testsleep1.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2018年07月03日 星期二 12时51分37秒
#=============================================================
#!/bin/bash
COUNTER=0
i=0
while [ $COUNTER -lt 5 ]
do
	i=`expr $i + 1`
	echo sleep $i
	sleep 1
done
