#!/bin/bash

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
#file=`ls`
#echo $file > tttt
for i in $(cat ./tttest); do
	if [[ $i =~ "all" ]]; then
		echo -e "\n-----fileName:$i""--------------\n"
		if [ ${i##*.} = gz ]; 
		then
			zcat $i | head -n 5
		else
			head -n 5 $i	
		fi
	fi
done
rm tttest
