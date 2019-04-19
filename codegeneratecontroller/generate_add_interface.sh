###################################################################
# File Name: generate_interface.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年02月13日 星期三 17时58分02秒
#=============================================================
#!/bin/bash

rm dst*
function generate()
{
	echo "public static final String $2 = \"$1\";" >> dst.java
	echo "public static final String $2_RESPONSE = \"$1Response\";" >> dst.java
	echo "public static final class tag$1 extends tagRequestType {" >> dst.java
	echo "public tag$1() {" >> dst.java
	echo -e "MethodName = $2;\n}\n}" >> dst.java

	echo -e "public static final class $1""Data {\n}" >> dst.java
	echo "public static final class tag$1""Response extends" >> dst.java
	echo "tagOLCRResponseType {" >> dst.java
	echo "public tag$1""Response(String Caller) {" >> dst.java
	echo "super(Caller);" >> dst.java
	echo -e "MethodName = $2_RESPONSE;\n}" >> dst.java
	echo "public $1""Data data;" >> dst.java
	echo -e "\n}" >> dst.java
	echo "------------------------------" >>dst.java
}

function generateDst2()
{ 
	echo "public Signal sig$1" "= new Signal(tag$1"".class, String.class);" >> dst.java
	echo "------------------------------" >>dst.java
}

function generateDst3() 
{
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1.connect(this, \"slot$1\");" >> dst.java
	echo "------------------------------" >>dst.java
}

function generateDst4()
{
	echo "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.sig$1.disconnectReceiver(this);" >> dst.java
	echo "------------------------------" >>dst.java
}

function generateDst5()
{
	echo -e "public void slot$1(final tag$1 tag, final String token) {" >> dst.java
	echo -e "OnLineClassroomManager.getInstance().$1(new CloudInterface() {" >> dst.java
	echo -e "@Override" >> dst.java
	echo -e "public void cloudCallback(CloudResponseStatus arg0, Object arg1) {" >> dst.java
	echo -e "tag$1""Response response = (tag$1""Response) arg1;" >> dst.java
	echo -e "if (token == null) {" >> dst.java
	echo -e "mFrmHomeOLCRControllerInterface.send$1""Response(response, token);" >> dst.java
	echo -e "} else {" >> dst.java
	echo -e "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send$1""Response(response, token);" >> dst.java
	echo -e "}\n}\n}, tag);\n}" >> dst.java
	echo "------------------------------" >>dst.java

	echo -e "public void send$1""Response(tag$1""Response response, String token);" >> dst.java
	echo "------------------------------" >>dst.java

	echo -e "public void send$1""Response(tag$1""Response response, String token){\n" >> dst.java
	echo -e "String jsonString = new Gson().toJson(response);\n" >> dst.java
	echo -e "mRefService.mEboxJNIBinder.mOnlineClassroomModuleManagement.send(jsonString, token);\n}" >> dst.java
	echo "------------------------------" >>dst.java

	echo -e "public void $1(final CloudInterface cloudInterface, final tag$1 tag$1) {\n" >> dst.java
	echo -e "if (DEBUG) {\nhandleResponseEventForDebug(cloudInterface, tag$1, tag$1""Response.class);\nreturn;\n}" >> dst.java
	echo -e "NetworkAsyncTask networkAsyncTask = new NetworkAsyncTask(new DataManagerInterface() {\n" >> dst.java
	echo -e "@Override\n" >> dst.java
	echo -e "public void getDataOnResult(String responseBody) {\n" >> dst.java
	echo -e "if (responseBody == null) {\n" >> dst.java
	echo -e "setErrMsg(cloudInterface);\n" >> dst.java
	echo -e "return;\n}\n" >> dst.java
#	echo -e "tag$1""Response info = (tag$1""Response) DataUtils.getObject(tag$1""Response.class, responseBody);" >> dst-interface.java
#	echo -e "info.Caller = tag$1.Caller;" >> dst-interface.java
#	echo -e "info.MethodName = tag$1.MethodName;" >> dst-interface.java
#	echo -e "if (info.errCode == 0) {" >> dst-interface.java
#	echo -e "cloudInterface.cloudCallback(CloudResponseStatus.Succ, info);" >> dst-interface.java
#	echo -e "} else {" >> dst-interface.java
#	echo -e "cloudInterface.cloudCallback(CloudResponseStatus.Failed, info);" >> dst-interface.java
#	echo -e "}\n}\n});\n" >> dst-interface.java

	echo -e "handleResponseEvent(cloudInterface, tag$1, responseBody, tag$1""Response.class);" >> dst.java
	echo -e "}\n});\n" >> dst.java
	echo -e "networkAsyncTask.setUrl(mUrlMap.get(tag$1.MethodName)).setRequestType(NetworkAsyncTask.TYPE_POST).execute();" >> dst.java
	echo -e "}" >> dst.java

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
function generate1
{
	while read line
	do
		if [ -n "$line" ]
		then
	        str3=$line
			str2=`echo $line | awk '{print $5}'`
			str=`echo $line | awk '{print $7}'`
			str=`echo ${str#\"}` #zuo->you
			str=`echo ${str/\"/}`
			str=`echo ${str%\;}`
			echo str1 $str
			echo str2 $str2
			generate $str $str2 "$str3"
		fi
		#cat $i | awk '{print $6}'
		#cat $i | awk '{print $7}'
	done < source
	echo --------end-------------
}

function generate2
{
	while read line
	do
		if [ -n "$line" ]
		then
			str2=$line
			str1=`echo ${str2#METHOD_OLCR_}`
			str1=`python -c 'import generate_name; print generate_name.str2Hump("'$str1'")'`
			str1=OLCR$str1
			echo str1 $str1
			echo str2 $str2
			generate $str1 $str2 "$str3"
			generateDst2 $str1
			generateDst3 $str1
			generateDst4 $str1
			generateDst5 $str1
		fi
		#cat $i | awk '{print $6}'
		#cat $i | awk '{print $7}'
	done < source
	echo --------end-------------

}

generate2
