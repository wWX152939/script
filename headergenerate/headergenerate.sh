###################################################################
# File Name: headergenerate.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年03月12日 星期二 15时55分13秒
#=============================================================
#!/bin/bash

function generate
{
	echo "#ifndef $2" >> $1
	echo "#define $2" >> $1
	echo "#endif /* $2 */" >> $1
}
if [ $1 ]
	then
	value=`echo ${1/\.h/}`
	echo $1 $value
	str2=`python -c 'import generate_name; print generate_name.change_variable_name2("'$value'")'`
	echo $1 $value $str2
	generate $1 $str2""_H_

fi
