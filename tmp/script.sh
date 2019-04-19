###################################################################
# File Name: script.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2017年12月08日 星期五 09时16分55秒
#=============================================================
#!/bin/bash
grep "Toast.makeText.*show" -rn src/ | awk -F ':' '{print $1}' #按：符号进行分割
awk '!a[$0]++' tmp  #剔除重复行
