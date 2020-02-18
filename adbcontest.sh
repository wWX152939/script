###################################################################
# File Name: adbcontest.sh
# Author: onekey
# mail: zhiwei.wang@mythware.com
# Created Time: 2019年06月12日 星期三 15时42分08秒
#=============================================================
#!/bin/bash
#getprop 192.168.0.57:2148
#[ro.myth.devinfo.sn]: [G8120001991901256014]
#getprop 192.168.0.57:2104
#[ro.myth.devinfo.sn]: [G8120001991901257073]
#getprop 192.168.0.57:2101
#[ro.myth.devinfo.sn]: [B1120001991802011032]
#getprop 192.168.0.57:2107
#[ro.myth.devinfo.sn]: [B1120001991712115001]
#getprop 192.168.0.57:2109
#[ro.myth.devinfo.sn]: [G8120001991901254041]
#getprop B21200019918080100F6
#[ro.myth.devinfo.sn]: [B21200019918080100F6]

adb connect 192.168.0.57:2109
adb connect 192.168.0.57:2107
adb connect 192.168.0.57:2101
adb connect 192.168.0.57:2104
adb connect 192.168.0.57:2148
