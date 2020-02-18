###################################################################
# File Name: analyse.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年04月15日 星期一 16时46分24秒
#=============================================================
#!/bin/bash

function info
{
	git log origin/$3 | grep -C 5 "Date.*"$2 | grep -A 7 $1 
}

function calcTotal
{
	#echo 1 2 3 $1 $2 $3
	total=`git log origin/$3 | grep -C 5 "Date.*"$2 | grep  $1 | wc -l`
	return $total
}
function calcMergeNum
{

	mergenum=`git log origin/$3 | grep -C 5 "Date.*"$2 | grep -C 5  $1  | grep Merge | wc -l`
	return $mergenum
	
}
function calcv4Bugs
{
	
	echo "fix v4 bugs"
	total=$(($total - $mergenum))
	echo $total
	
	#git log origin/v5 | grep -C 5 "Date.*Mar" | grep  -C 5 selivert.xu 


}
function calcBugs
{
	echo "fix $3 bugs" >> tmp
	calcTotal $1 $2 $3 
	total=$?
	#echo total $total
	calcMergeNum $1 $2 $3
	mergeNum=$?
	#echo mergeNum $mergeNum
	total=$(($total - $mergenum))
	echo $total >> tmp
	echo --------------*******************$3 bugs***********************--------------------	
	git log origin/$3 | grep -C 5 "Date.*"$2 | grep  -A 5 $1 


}
function calcv5Bugs
{
	branch=v5	
	echo "fix v5 bugs"
	#total=`git log origin/$branch | grep -C 5 "Date.*"$2 | grep  $1 | wc -l`
	#mergenum=`git log origin/$branch | grep -C 5 "Date.*"$2 | grep -C 5  $1  | grep Merge | wc -l`
	calcTotal $1 $2 $branch
	total=$?
	echo $total
	calcMergeNum $1 $2 $branch
	mergeNum=$?
	echo $mergeNum
	total=$(($total - $mergenum))
	echo $total
	
	#git log origin/v5 | grep -C 5 "Date.*Mar" | grep  -C 5 selivert.xu 


}
function calcv6Bugs
{
	
	echo "fix v6 bugs"
	total=`git log origin/v6 | grep -C 5 "Date.*"$2 | grep  $1 | wc -l`
	mergenum=`git log origin/v6 | grep -C 5 "Date.*"$2 | grep -C 5  $1  | grep Merge | wc -l`
	total=$(($total - $mergenum))
	echo $total
	
	#git log origin/v5 | grep -C 5 "Date.*Mar" | grep  -C 5 selivert.xu 

}
function calcv7Bugs
{
	
	echo "fix v7 bugs"
	total=`git log origin/v7 | grep -C 5 "Date.*"$2 | grep  $1 | wc -l`
	mergenum=`git log origin/v7 | grep -C 5 "Date.*"$2 | grep -C 5  $1  | grep Merge | wc -l`
	total=$(($total - $mergenum))
	echo $total
	
	#git log origin/v5 | grep -C 5 "Date.*Mar" | grep  -C 5 selivert.xu 

}
#selivert.xu
#chunliang.chen
#jing.zeng
name="zhiwei"
if [ $1 == xp ]
	then
	name="selivert.xu"
elif [ $1 == ccl ]
	then
	name="chunliang.chen"
elif [ $1 == zj ]
	then
	name="jing.zeng"
fi
month=""
if [ $2 == 4 ]
	then
	month="Apr"
elif [ $2 == 3 ]
	then
	month="Mar"
elif [ $2 == 2 ]
	then
	month="Feb"
elif [ $2 == 1 ]
	then
	month="Jan"
elif [ $2 == 12 ]
	then
	month="Dec"
elif [ $2 == 11 ]
	then
	month="Nov"
elif [ $2 == 10 ]
	then
	month="Oct"
elif [ $2 == 9 ]
	then
	month="Sep"
elif [ $2 == 8 ]
	then
	month="Aug"
elif [ $2 == 7 ]
	then
	month="Jul"
elif [ $2 == 6 ]
	then
	month="Jun"
elif [ $2 == 5 ]
	then
	month="May"
fi

echo Month $month
echo $3
if [ -n "$3" ]
	then
	info $name $month $3
else
	if [ "$name" != "" ]
		then
		calcBugs $name $month "v5"
		calcBugs $name $month v6
		calcBugs $name $month v7
	fi
fi
cat tmp
rm tmp

