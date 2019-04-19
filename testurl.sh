###################################################################
# File Name: testurl.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2017年07月13日 星期四 09时09分39秒
#=============================================================
#!/bin/bash


for ((i=4; i<=100; i ++))  
do  
	s="http://192.168.0."$i":8088/#/c/600/"
	echo $s
	curl $s
done  
