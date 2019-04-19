###################################################################
# File Name: tt.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2017年11月16日 星期四 09时44分04秒
#=============================================================
#!/bin/bash
rm tttest
touch tttest
function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            getdir $dir_or_file
        else
            echo $dir_or_file >> tttest
        fi  
    done
}
root_dir="."
getdir $root_dir
