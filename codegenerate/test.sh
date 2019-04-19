###################################################################
# File Name: test.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年02月21日 星期四 09时46分11秒
#=============================================================
#!/bin/bash

#if [ $1 ] 
#	then
#	echo "has"
#fi
function getFileName()
{
    if [ $2 ]
        then
		echo $1
    else
		echo "dst.java"
    fi
}

n=`getFileName $1 $2`
echo n=$n
