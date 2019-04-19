###################################################################
# File Name: exec.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2017年12月08日 星期五 09时18分05秒
#=============================================================
#!/bin/bash
for j in $(cat ./tmp1); do
	#echo $j 替换
	sed -i 's/Toast.makeText\(.*\),\(.*\),\(.*\)show();/mRefService.showToast(\2);/g' $j 
done
