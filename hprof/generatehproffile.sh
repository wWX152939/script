###################################################################
# File Name: generatehproffile.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年06月03日 星期一 14时49分15秒
#=============================================================
#!/bin/bash
adb shell rm /sdcard/heap.hprof
id=`adb shell ps | grep mythware.castbox.server | awk '{print $2}'`;
adb shell am dumpheap $id /sdcard/heap.hprof
echo id $id generate file...
sleep 1
adb pull /sdcard/heap.hprof .
output=heap$1.hprof
echo output $output
/home/onekey/3rd/Android/AndroidSDK/platform-tools/hprof-conv heap.hprof $output
