#########################################################################
# File Name: request.sh
# Author: onekey
# mail: www87538089@qq.com
# Created Time: Wed Jan 18 10:50:49 2017
#########################################################################
#!/bin/sh

#########################################################################
# initial environment
searchid=$2
tenantid=
projectid=
groupid=
level1=

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

function request()
{
	log $1
	curl -H "Content-Type: application/json" -X POST  --data $1  http://192.168.18.100:3090/cepm360/action -s -o test1
	cat test1
#{"calss":"com.pm360.cepm360.services.common.FlowApproveService","method":"getCountersignList","p0":"58"}
}

function addTask()
{
## must ensure there is no task before
request "{"method":"addTask","calss":"com.pm360.cepm360.services.group.TaskService","p0":{"name":"114","start_time":"2017-01-18","end_time":"2017-01-27","plan_duration":"9天","owner":"55","department":"49","type":"task","parents_id":"0","has_child":"false","tenant_id":$tenantid,"zh_group_id":$groupid},"_t":1484705997336}"
}

function addSubTask()
{
log "task id is $1"
# add file
request "{"p0":{"serialVersionUID":"-6965508115042679908","file_id":"0","directory_id":"","type_id":$1,"code":"","title":"QQ图片20161226102911","author":"55","status":"","version":"","score":"0","dir_type":"3","path":"","file_name":"QQ??20161226102911.png","file_type":"png","file_size":74044,"file_path":"/cepm360/upload/$tenantid/QQ??20161226102911.png","create_time":"","modified_time":"","mark":"","archive":"0","top":"0","tenant_id":$tenantid,"project_id":$projectid,"task_id":"0","project_name":"","appUpdateFlag":"0"},"p1":[{"tenant_id":5103304,"role":"XMJL","address":"nanjin","create_time":"2016-11-03","sex":"男","mobile":"18061771291","birth":"1985-11-23","permission":"","login_name":"18061771291","user_id":55,"name":"李易峰","tel":"0550-2114563","obs_name":"工程部","pwd":"1","email":"","obs_id":49},{"tenant_id":5103304,"role":"XMJL","address":"nanjin","create_time":"2016-11-03","sex":"男","mobile":"18061771291","birth":"1985-11-23","permission":"","login_name":"18061771291","user_id":55,"name":"李易峰","tel":"0550-2114563","obs_name":"工程部","pwd":"1","email":"","obs_id":49}],"p2":"55","method":"addFile","calss":"com.pm360.cepm360.services.documents.DocumentsService","_t":1484706027378}"
#add worklog
request "{"method":"addWorkLog","calss":"com.pm360.cepm360.services.group.WorkLogService","p0":{"content":"15","zh_group_id":$groupid,"task_id":$1,"msg_user":"0"},"_t":1484706032997}"
#add safety
request "{"method":"addSafety","p0":{"name":"15","type":"1","content":"15","event_date":"2017-01-18","zh_group_id":$groupid,"task_id":$1,"tenant_id":$tenantid,"msg_user":"0"},"calss":"com.pm360.cepm360.services.plan.SafetyService","_t":1484706038462}"
#add quality
request "{"method":"addQuality","p0":{"name":"15","type":"1","content":"15","event_date":"2017-01-18","zh_group_id":$groupid,"task_id":$1,"tenant_id":$tenantid,"msg_user":"0"},"calss":"com.pm360.cepm360.services.plan.QualityService","_t":1484706045271}"
#add feedback
request "{"method":"updateFeedback","calss":"com.pm360.cepm360.services.group.TaskService","p0":{"task_id":$1,"status":"1","mark":"begin","actual_start_time":"2017-01-18","actual_end_time":"2017-01-27","progress":9,"feedback_id":"0","zh_group_id":$groupid,"task_name":"114","change_id":"9","feedback_creater":"55","parents_user":"0"},"p1":"5103304","_t":1484706055635}"
}

function dotask()
{
request "{"method":"getGroup","calss":"com.pm360.cepm360.services.group.GroupService","p0":$searchid,"_t":1484705954260}"
groupid=$(sed -n 's/.*"zh_group_id\\":\([0-9]*\).*/\1/p' test1)
tenantid=$(sed -n 's/.*"tenant_id\\":\([0-9]*\).*/\1/p' test1)
projectid=$(sed -n 's/.*"project_id\\":\([0-9]*\).*/\1/p' test1)
tmpstring=$(cat test1)

t=$(cat test1 | sed 's:\\::g')
groupname=$(echo "${t//\"/}" | sed 's/{.*'"node_name"':\([^,}]*\).*}/\1/')
addTask
sed -n 's/.*"task_id\\":\([0-9]*\).*/\1/p' test1 > test2
taskid=$(cat test2)
request "{"method":"publish","calss":"com.pm360.cepm360.services.group.TaskService","p0":$projectid,"p1":$groupid,"p2":$groupname,"_t":1484706016879}"
addSubTask $taskid
#echo g $groupid t $tenantid p $projectid
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
    
    else
        echo "no match, exit"
    fi
fi
