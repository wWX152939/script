#########################################################################
# File Name: sqltest.sh
# Author: onekey
# mail: www87538089@qq.com
# Created Time: Thu Jan 12 14:21:20 2017
#########################################################################
#!/bin/bash

id=$2

function deletefile()
{
	if [ -f $1 ]
	then
	rm $1*
	fi
}
#########################################################################
#initial environment
level1=
level2=
level3=
level4=
rm idfile*
deletefile tmp

declare -A map=(
["1"]="有钱" 
["2"]="合同付款审批"
["3"]="合同付款会签"
["10"]="现场图片"
["11"]="公共文档"
["16"]="任务发布"
["17"]="任务反馈"
["18"]="安全监督"
["19"]="质量文明"
["25"]="项目文档")
#########################################################################
function log() 
{
	let level1++
	level2=
	level3=
	level4=
    echo ""
    echo "------------------------>>>>>$level1    $1    <<<<<---------"
    echo ""
}

function log1() 
{
	let level2++
	level3=
	level4=
	level=$level1"."$level2
    echo ""
    echo "    -------------------->>>>>$level    $1    <<<<<---------"
    echo ""
}

function log2() 
{
	let level3++
	level4=
	level=$level1"."$level2"."$level3
    echo ""
    echo "        ---------------->>>>>$level    $1    <<<<<---------"
    echo ""
}


function log3() 
{
	let level4++
	level=$level1"."$level2"."$level3"."$level4
    echo ""
    echo "            ------------>>>>>$level    $1    <<<<<---------"
    echo ""
}

function formatRelatefile()
{
	cat $1 |awk '{print $1; fflush()}' > tmp1
	sed -in "1d" tmp1
}

function search()
{
    mysql -uroot -pxuyongjun -e"select * from cepm360.$1"
}

#tmp 
#tmp1 id 随时会被覆盖
function searchAndSaveId()
{
    mysql -uroot -pxuyongjun -e"select * from cepm360.$1" > tmp
	cat tmp
	formatRelatefile tmp
	cat tmp1 >> idfile$2
}

function searchmsg()
{
    log1 "message" 
	echo $1
	for i in $1; do
		idlist=
		for j in $(cat ./idfile$i); do
			idlist+=$j","
		done
		idlist=${idlist%?} #去掉最后一个字符
		if [ $idlist ]
			then
    		log2 "message type=$i ${map["$i"]} and type_id in $idlist"
    		mysql -uroot -pxuyongjun -e"select * from cepm360.message where type=$i and type_id in ($idlist) order by message_id desc limit 20"
		else
    		log2 "message type=$i ${map["$i"]} and type_id in $idlist"
		fi
	done

    #log1 "message type in $1 and type_id in $idlist"
    #mysql -uroot -pxuyongjun -e"select * from cepm360.message where type in ($1) and type_id in ($idlist) order by message_id desc limit 20"
}

function dotask()
{
    log "search task id is $id"

    log1 "zh_group_task"
	search "zh_group_task where task_id=$id"
	log1 "zh_group_copy_task"
	searchAndSaveId "zh_group_copy_task where task_id=$id" 16
	log1 "zh_group_feedback"
	searchAndSaveId "zh_group_feedback where task_id=$id" 17
    log1 "safety"
    searchAndSaveId "safety where task_id=$id" 18
    log1 "quality"
    searchAndSaveId "quality where task_id=$id" 19
    log1 "zh_group_worklog"
    search "zh_group_worklog where task_id=$id"
	#file 需要保留，但是现场图文的消息需要删除
	log1 "file"
    searchAndSaveId "files where type_id=$id and dir_type=3" 10
	arr=(16 10 17 18 19)
    searchmsg "${arr[*]}"
}

function dogroup()
{
    log "search group id is $id"

    log1 "zh_group"
    search "zh_group where zh_group_id =$id"
    log1 "zh_group_task"
    search "zh_group_task where zh_group_id =$id"
	log1 "zh_group_copy_task"
	searchAndSaveId "zh_group_copy_task where zh_group_id=$id" 16

	log1 "file"
	for i in $(cat ./tmp1); do
		task_id+=$i","
	done
	task_id=${task_id%?}
	log2 "file in task_id($task_id)"
	if [ "" != $task_id ]
		then
    	searchAndSaveId "files where type_id in ("$task_id") and dir_type=3" 10
	fi

	log1 "zh_group_feedback"
	searchAndSaveId "zh_group_feedback where zh_group_id=$id" 17
    log1 "safety"
    searchAndSaveId "safety where zh_group_id =$id" 18
    log1 "quality"
    searchAndSaveId "quality where zh_group_id =$id" 19
    log1 "zh_group_worklog"
    search "zh_group_worklog where zh_group_id =$id"
	arr=(16 10 17 18 19)
    searchmsg "${arr[*]}"

}

function docontract1()
{
    log "search revenue contract id is $id"
    search "contract_revenue where contract_id=$id"
    log1 "cashback"
    search "contract_revenue_cashback where contract_id=$id"
    log1 "list"
    search "contract_revenue_list where contract_id=$id"
}

function docontract2()
{
    log "search expenses contract id is $id"
    search "contract_expenses where contract_id=$id"
    log1 "list"
    search "contract_expenses_list where contract_id=$id"
    log1 "pay"
    search "contract_expenses_pay where contract_id=$id"
    log1 "flow_approval"
    searchAndSaveId "flow_approval where type_id=$id and flow_type=2" 2
	for i in $(cat ./tmp1) ; do
    log2 "flow_countersign flow_approval_id is $i"
    searchAndSaveId "flow_countersign where flow_approval_id=$i" 3
	done
	arr=(2 3)
    searchmsg "${arr[*]}"
}

function dodocument()
{
    log "search document id is $id"

	log1 "document"
	searchAndSaveId "document where path like '%$id%'"
	for i in $(cat ./tmp1); do
	documentids+=$i","
	done
	documentids=${documentids%?}
	if [ $documentids ]
		then
		log1 "files"
		searchAndSaveId "files where directory_id in ($documentids)" 25
	fi
	arr=(25)
	searchmsg "${arr[*]}"
}

function doannouncement()
{
    log "search announcement id is $id"

	log1 "announcement"
	search "announcement where announcement_id=$id"
	log1 "message"
	search "message where type=12 and type_id=$id"
}

function doproject()
{
    log "search project id is $id"
	log1 "group"
	searchAndSaveId "zh_group where project_id=$id"
	for i in $(cat ./tmp1); do
	#grouparray=(${grouparray[*]} $i)
	groupids+=$i","
	done
	groupids=${groupids%?}
	#for i in ${grouparray[*]}; do
	#echo $i
	#done
	log1 "task"
	searchAndSaveId "zh_group_task where zh_group_id in ($groupids)"
	log1 "copy_task"
	searchAndSaveId "zh_group_copy_task where zh_group_id in ($groupids)" 16
	
	log1 "file"
	for i in $(cat ./tmp1); do
		task_id+=$i","
	done
	task_id=${task_id%?}
	log2 "file in task_id($task_id)"
	if [ $task_id ]
		then
    	searchAndSaveId "files where type_id in ("$task_id") and dir_type=3" 10
	fi

	log1 "feedback"
	searchAndSaveId "zh_group_feedback where zh_group_id in ($groupids)" 17
	log1 "worklog"
	search "zh_group_worklog where zh_group_id in ($groupids)"
	log1 "safety"
	searchAndSaveId "safety where zh_group_id in ($groupids)" 18
	log1 "quality"
	searchAndSaveId "quality where zh_group_id in ($groupids)" 19
	
	log1 "revenue contract"
    searchAndSaveId "contract_revenue where project_id=$id"
	for i in $(cat ./tmp1); do
	revenuecontractIds+=$i","
	done
	revenuecontractIds=${revenuecontractIds%?}
	if [ $revenuecontractIds ]
		then
    	log2 "cashback"
    	search "contract_revenue_cashback where contract_id in ($revenuecontractIds)"
    	log2 "list"
    	search "contract_revenue_list where contract_id in ($revenuecontractIds)"
	fi

	log1 "expenses contract"
    searchAndSaveId "contract_expenses where project_id=$id"

	for i in $(cat ./tmp1); do
	expensescontractIds+=$i","
	done
	expensescontractIds=${expensescontractIds%?}

	if [ $expensescontractIds ]
		then
    	log2 "list"
    	search "contract_expenses_list where contract_id in ($expensescontractIds)"
    	log2 "pay"
    	search "contract_expenses_pay where contract_id in ($expensescontractIds)"
    	log2 "flow_approval"
    	searchAndSaveId "flow_approval where type_id in ($expensescontractIds) and flow_type=2" 2
		for i in $(cat ./tmp1) ; do
    	log3 "flow_countersign flow_approval_id is $i"
    	searchAndSaveId "flow_countersign where flow_approval_id=$i" 3
		done
	fi

	log1 "document"
	searchAndSaveId "document where project_id=$id"
	log1 "files"
	searchAndSaveId "files where project_id=$id" 25

	arr=(2 3 10 16 17 18 19 25)
    searchmsg "${arr[*]}"
}

function dotenant
{
	log "tenant"
	search "tenant where tenant_id=$id"
	log "project"
	search "project where tenant_id=$id"

}

if [ ! -n "$1" -o ! -n "$2" ]
then
    if [ ! -n "$1" ]
        then
        echo "pls input params1 and params2!"
    elif [ ! -n "$2" ]
        then
        echo "pls input params2!"
    fi
else
    if [ $1 == "task" ]
        then
		dotask
    
    elif [ $1 == "contract1" ]
        then
		docontract1
	elif [ $1 == "contract2" ]
		then
		docontract2
    
    elif [ $1 == "document" ]
        then
		dodocument
    
    elif [ $1 == "group" ]
        then
		dogroup
    
    elif [ $1 == "announcement" ]
        then
		doannouncement
    
    elif [ $1 == "project" ]
        then
		doproject

	elif [ $1 == "tenant" ]
		then
		dotenant
    
    else
        echo "no match, exit"
    fi
fi
