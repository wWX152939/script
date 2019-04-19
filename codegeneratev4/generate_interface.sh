###################################################################
# File Name: generate_interface.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年02月13日 星期三 17时58分02秒
#=============================================================
#!/bin/bash

rm dst*
signal="n"
function getFileName()
{
	if [ $signal == "n" ]
		then
		echo $1
	else
		echo dst.java
	fi
}

count=0
function generate()
{
	let "count=$count+1"
	echo -e "/**\n*$count.$1\n*/" >> dst.java
	echo "public static final String $2_REQUEST = \"$1Request\";" >> dst.java
	echo "public static final String $2_RESPONSE = \"$1Response\";" >> dst.java
	echo "public static final class tag$1""Request extends tagRequestType {" >> dst.java
	echo "public tag$1""Request() {" >> dst.java
	echo -e "MethodName = $2_REQUEST;\n}\n}" >> dst.java
	echo "public static final class tag$1""Response extends" >> dst.java
	echo "tagRequestType{" >> dst.java
	echo "public tag$1""Response(String Caller) {" >> dst.java
	echo "super(Caller);" >> dst.java
	echo -e "MethodName = $2_RESPONSE;\n}" >> dst.java
	echo "public int Result;" >> dst.java
	#echo "public String Describe;" >> dst.java
	echo -e "\n}" >> dst.java

	fileName=`getFileName dstModuleManage1.java`
	echo "public Signal sig$1" "= new Signal(tag$1"".class, String.class);" >> $fileName
	fileName=`getFileName dstControllerslotcon.java`
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1.connect(this, \"slot$1\");" >> $fileName
	fileName=`getFileName dstControllerslotdiscon.java`
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1.disconnectReceiver(this);" >> $fileName

	fileName=`getFileName dstController.java`
	echo -e "public void slot$1(final tag$1 tag, final String token) {" >> $fileName
	echo -e "OnLineClassroomManager.getInstance().$1(new CloudInterface() {" >> $fileName
	echo -e "@Override" >> $fileName
	echo -e "public void cloudCallback(CloudResponseStatus arg0, Object arg1) {" >> $fileName
	echo -e "tag$1""Response response = (tag$1""Response) arg1;" >> $fileName
	echo -e "if (token == null) {" >> $fileName
	echo -e "mFrmHomeOLCRControllerInterface.send$1""Response(response, token);" >> $fileName
	echo -e "} else {" >> $fileName
	echo -e "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(response, token);" >> $fileName
	echo -e "}\n}\n}, tag);\n}" >> $fileName

	fileName=`getFileName dstController1.java`
	echo -e "public void send$1""Response(tag$1""Response response, String token);" >> $fileName

#	fileName=`getFileName dstModuleManage2.java`
#	echo -e "public void send$1""Response(tag$1""Response response, String token){\n" >> $fileName
#	echo -e "String jsonString = new Gson().toJson(response);\n" >> $fileName
#	echo -e "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(jsonString, token);\n}" >> $fileName

	fileName=`getFileName dst-interface.java`
	echo -e "public void $1(final CloudInterface cloudInterface, final tag$1 tag$1) {\n" >> $fileName
	echo -e "if (DEBUG) {\nhandleResponseEventForDebug(cloudInterface, tag$1, tag$1""Response.class);\nreturn;\n}" >> $fileName
	echo -e "NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {\n" >> $fileName
	echo -e "@Override\n" >> $fileName
	echo -e "public void getDataOnResult(String responseBody) {\n" >> $fileName
	echo -e "if (responseBody == null) {\n" >> $fileName
	echo -e "setErrMsg(cloudInterface);\n" >> $fileName
	echo -e "return;\n}\n" >> $fileName
#	echo -e "tag$1""Response info = (tag$1""Response) DataUtils.getObject(tag$1""Response.class, responseBody);" >> $fileName
#	echo -e "info.Caller = tag$1.Caller;" >> $fileName
#	echo -e "info.MethodName = tag$1.MethodName;" >> $fileName
#	echo -e "if (info.errCode == 0) {" >> $fileName
#	echo -e "cloudInterface.cloudCallback(CloudResponseStatus.Succ, info);" >> $fileName
#	echo -e "} else {" >> $fileName
#	echo -e "cloudInterface.cloudCallback(CloudResponseStatus.Failed, info);" >> $fileName
#	echo -e "}\n}\n});\n" >> $fileName
	echo -e "handleResponseEvent(cloudInterface, tag$1, responseBody, tag$1""Response.class);" >> $fileName
	echo -e "}\n});\n" >> $fileName
	echo -e "networkAsyncTask.setUrl(mUrlMap.get(tag$1.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();" >> $fileName
	echo -e "}" >> $fileName

	if [ ! -d json ]
	then
		mkdir json
	fi
	touch ./json/$1Response.json

	if [ $signal == "y" ]
		then
		echo ------------------------------------------------------------------ >> $fileName
	fi
}

function generateNotify()
{
	suffix1="_NOTIFY"
	suffix2="Notify"
	echo "public static final String $2$suffix1= \"$1$suffix2\";" >> dst.java
	echo -e "public static final class $1""Data {\n}" >> dst.java
	echo "public static final class tag$1""$suffix2 extends" >> dst.java
	echo "tagRequestType {" >> dst.java
	echo "public tag$1""$suffix2() {" >> dst.java
	echo -e "MethodName = $2$suffix1;\n}" >> dst.java
	echo "public $1""Data data;" >> dst.java
	echo -e "\n}" >> dst.java

	fileName=`getFileName dstModuleManage1.java`
	echo "public Signal sig$1$suffix2 = new Signal(tag$1$suffix2.class);" >> $fileName
	fileName=`getFileName dstControllerslotcon.java`
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1$suffix2.connect(this, \"slot$1$suffix2\");" >> $fileName
	fileName=`getFileName dstControllerslotdiscon.java`
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1$suffix2.disconnectReceiver(this);" >> $fileName

	fileName=`getFileName dstController.java`
	echo -e "public void slot$1$suffix2(final tag$1$suffix2 $suffix2) {" >> $fileName
	echo -e "mFrmHomeOLCRControllerInterface.send$1""$suffix2($suffix2);" >> $fileName
	echo -e "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sendNotify($suffix2);" >> $fileName
	echo -e "}" >> $fileName

	fileName=`getFileName dstController1.java`
	echo -e "public void send$1""$suffix2(tag$1""$suffix2 $suffix2);" >> $fileName

	if [ $signal == "y" ]
		then
		echo ------------------------------------------------------------------ >> $fileName
	fi
	if [ ! -d json ]
	then
		mkdir json
	fi
	touch ./json/$1Response.json
}
#generate OLCRLogin METHOD_OLCR_LOGIN 
#cat dst.java
#METHOD_OLCR_LOGIN
str=

function JNIBinder
{
	#echo $1,
	echo "case $1: {break;}"
}
function generate2
{
	while read line
	do
		if [ -n "$line" ]
		then
			if [ $1 ]
				then
					signal="y"
				fi
			str1=$line
			str1=`echo ${line/%Request/}`
			#str1=`echo ${str2#METHOD_OLCR_}`
			str2=`python -c 'import generate_name; print generate_name.change_variable_name("'$str1'")'`
			JNIBinder NEV_$str2""_RESPONSE
			str2=METHOD_$str2
			#echo str1 $str1
			#echo str2 $str2
			generate $str1 $str2 "$str3"
			#generateNotify $str1 $str2 "$str3"
		fi
		#cat $i | awk '{print $6}'
		#cat $i | awk '{print $7}'
	done < source
	echo --------end-------------

}

generate2 $1
