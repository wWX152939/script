###################################################################
# File Name: search.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2020年01月16日 星期四 16时44分14秒
#=============================================================
#!/bin/bash

file=$1
searchContent=$2

function search
{

	git log $file | grep commit | awk '{print $2}' > tmp
	for i in $(cat ./tmp); do
		#echo 1$i
		ret=`git show $i | grep "$searchContent"`
		#echo 2$ret
		if [ ! -n "$ret" ]
			then
			let j++
			#echo 3----$ret
		else
			echo 4----$ret
			git show $i | grep -A 7	$i
		fi
	done
}

search $file $searchContent
