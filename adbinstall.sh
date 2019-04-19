#!/bin/sh
#安装并启动

#apkinstall='adb install -r $1'
function teacher()
{
	if [ ! -n "$1" ]
		then
	
		echo "am start"
		adb shell am start -n mythware.classroom.teacher/mythware.ux.teacher.form.MainActivity
		sleep 8
	fi
		echo "input tap 732 392"
		adb shell input tap 732 392
		sleep 2
		echo "input tap 788 491"
		adb shell input tap 788 491
}
if [ -n "$1" ] 
	then
	ll $1
		
	for((i=1;i<100;i++))
	do
	    echo $i
		adb install -r $1 > tmp
		sleep 1
		ret=`cat tmp | tail -1`
	    if [ -n "$ret" ]
			then
			strB="Success"
	    	if [[ $ret == *$strB* ]]
	    	    then
				echo Success
			
				if [[ $1 == *"Student"* ]]
				then
					echo Student
					adb shell am start -n mythware.classroom.client/mythware.ux.student.form.MainActivity
				elif [[ $1 == *"student"* ]]
				then
					echo student
					adb shell am start -n mythware.classroom.client/mythware.ux.student.form.MainActivity
				elif [[ $1 == *"Teacher"* ]]
				then
					echo Teacher
					adb shell am start -n mythware.classroom.teacher/mythware.ux.teacher.form.MainActivity
				elif [[ $1 == *"teacher"* ]]
				then
					echo teacher
					sleep 5
					adb shell am start -n mythware.classroom.teacher/mythware.ux.teacher.form.MainActivity
				fi

				break
			else
				echo Failed
			fi
		fi
		rm tmp
		sleep 1
	done	
fi	

