# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH=~/bin:$PATH

###################
####set alias #####
###################
alias showenv='cat /home/onekey/3rd/workplan/env/ruzhi.txt'
alias firefox='/home/onekey/Downloads/oa/firefox/firefox-bin'
alias ecl='$HOME/3rd/tools/eclipse/eclipse '
alias astah='$HOME/3rd/tools/astah_professional/astah'
alias weixin='$HOME/3rd/tools/electronic-wechat-linux-x64/electronic-wechat'
alias androidstudio='/home/onekey/3rd/tools/android-studio/bin/studio.sh'
alias targz='tar -xvzf $1'  #gzip
alias tarbz='tar -xvjf $1'  #bz2
alias clearcache='sudo sysctl -w vm.drop_caches=3'

#set enter path
alias AndroidNDK='cd $HOME/3rd/Android/AndroidNDK'
alias AndroidSDK='cd /media/onekey/Android/AndroidSDK'
alias student='cd /media/truecrypt32/svn/Projects/prj_ClassroomClient'
alias teacher='cd /media/truecrypt32/svn/Projects/prj_ClassroomTeacher'
alias ateacher='cd /media/truecrypt32/androidstudio/Projects/prj_ClassroomTeacher'
alias cloud='cd /media/truecrypt32/svn/ClassCloud/Android'
alias acloud='cd /media/truecrypt32/androidstudio/ClassCloud/Android'
alias gitwork='cd $HOME/3rd/workplan/roommanager-project'
alias envo='cd $HOME/3rd/workplan/env'
alias workplan='cd $HOME/3rd/workplan'
alias workspace='cd $HOME/3rd/workplan/workspace'
alias work='cd /media/truecrypt32/svn/Cast'
alias v2work='cd /media/truecrypt32/svn/Cast/V2Cast/Android'
alias v6work='cd /media/truecrypt32/git/CastServer'
alias v5work='cd /media/truecrypt32/git/CastServer-v5'
alias v6workcontroller='cd /media/truecrypt32/git/CastController'
alias v2workserver='cd /media/truecrypt32/svn/Cast/V2Cast/Android/CastServer'
alias 3rd='cd $HOME/3rd'
alias testc='cd $HOME/3rd/workplan/C++'
alias code=$teacher
alias download='cd $HOME/Downloads'
alias project='cd $HOME/Downloads/project'
alias public='cd $HOME/Public'
alias log='cd $HOME/log'

#set adb
#apkpath='/home/onekey/3rd/Android/AndroidNDK/samples/native-codec/bin/NativeCodec.apk'
scriptpath='/home/onekey/3rd/workplan/git/script'
alias shpath='cd $scriptpath'
alias adbd='adb devices'
alias adbs='adb shell'
apkpath='/media/truecrypt32/svn/Projects/prj_ClassroomTeacher/bin/Android-Teacher-debug.apk'
alias apkrun='source $scriptpath/apkinstall.sh $apkpath run'
apkpathecl='/media/truecrypt32/svn/Projects/prj_ClassroomTeacher/bin/classroom-teacher.apk'
alias apkinstall='source $scriptpath/apkinstall.sh $apkpathecl'
alias adbinstall='source $scriptpath/adbinstall.sh $1'

alias adbcontroller='adb -s HT4B6JT04415'
alias adb360='adb -s YTSKDQHQT4ZTWSRS'
alias adbmeizu='adb -s 88CKBMC23RDW'
#alias adbserver='adb -s 0123456789ABCDEF'
#alias adbserver='adb -s B1120001991712114004'
alias adbserver='adb -s $adbserver'
#alias adbdragon='adb -s B1120001991802010035'
#alias adbdragon='adb -s B1120001991802015092'
alias adbdragon='adb -s $adbserver'
#alias adbserver='adb -s B1120001991712078001'
alias adbhuawei='adb -s CJL0216913005590'
alias adbpadhuawei='adb -s TJF4C15806003686'
alias adbhtc='adb -s HT4B6JT04415'
alias adblenovo='adb -s LenovoTAB2A8'
ipcast='10.88.254'
alias adbip='_ip(){ adb -s $ipcast.$1:5555 $2; }; _ip'
alias adbiplogcats='_ip(){ adb -s $ipcast.$1:5555 logcat -s $2; }; _ip'
alias adbiplogcat='_ip(){ adb -s $ipcast.$1:5555 logcat -v time; }; _ip'
alias adbcon='con(){ adb connect $ipcast.$1; }; con'
alias adbdis='adb disconnect'

alias exportlog='source /home/onekey/3rd/workplan/git/script/export.sh'
alias logexport='source /home/onekey/3rd/workplan/git/script/exportcontroller.sh'

#generate
export PYTHONPATH=$PYTHONPATH:/home/onekey/3rd/workplan/git/script/python
alias generateh='source /home/onekey/3rd/workplan/git/script/headergenerate/headergenerate.sh'

alias startapk='source $scriptpath/startapk.sh'
#cloud
alias searchCloud='adb logcat -s ClassCloud | grep $1'
#alias pulllog='adb pull /sdcard/Android/data/mythware.classroom.cloud/files $1'
alias pullalllog='adb pull /data/logger/log.all.txt'
alias vialllog='vi log.all.txt'
alias pulllog='adb pull /sdcard/Android/data/mythware.castbox.server/files $1'
alias showlog='showlog(){ adb shell ls /sdcard/Android/data/mythware.castbox.server/files; }; showlog'
alias catlog='catlog(){ adb shell cat /sdcard/Android/data/mythware.castbox.server/files/$1; }; catlog'
#alias testlog='catlog1(){ cat ./log; }; showlog;catlog $1;'
alias testlog='catlog1(){ echo $name }; showlog ;catlog1;'
#alias adbenter='adb shell cd /sdcard/Android/data/mythware.classroom.cloud/files'
alias adbenter='adb shell cd /sdcard/Android/data/mythware.castbox.server/files'
alias adbinput='adb shell input text'
alias adbkillserver='source /home/onekey/3rd/workplan/git/script/adbkillserver.sh'
alias loginjyy='source /home/onekey/3rd/workplan/git/script/loginjyy.sh'
alias loginmythwareid='source /home/onekey/3rd/workplan/git/script/loginmythwareid.sh'

#castcontroller
alias searchController='adb logcat -s CastController | grep $1'
alias castcontroller='cd /media/truecrypt32/svn/Cast/CastController/CastController/'
alias tmp='cd ~/Templates'
alias prjservice='cd /media/truecrypt32/svn/Projects/prj_SystemService_after5.0'
alias icepath='cd /home/onekey/Downloads/code/ice/examples/msp_cloud/examples/java/sc2mcu'
alias diskpath='cd /media/onekey/bcc9b33e-ac0c-4145-96c9-1024df8e0472'
alias compileslice='slice2java -I /usr/share/ice/slice --compat'

#alias killcastbox='j=`adb shell ps | grep castbox | awk '{print $2}'`; adb root;adb shell kill $j'
alias lint='export JAVA_HOME=/home/onekey/3rd/Android/jdk1.8.0_102;/media/onekey/Android/AndroidSDK/tools/bin/lint'

alias catb='cat ~/.bashrc'
alias vib='vi ~/.bashrc'
alias sourceb='source ~/.bashrc'
#git
alias gits='git status'
alias gitb='git branch'
alias gitpull='git pull'
alias gitpmaster='git push origin HEAD:refs/for/master'
alias gitpv6='git push origin HEAD:refs/for/v6'
alias gitpv5='git push origin HEAD:refs/for/v5'
alias gitpv4='git push origin HEAD:refs/for/v4'
alias gitc='git commit -m'
alias gitignore='git update-index --assume-unchanged'
alias gitunignore='git update-index --no-assume-unchanged'
alias gitignorelist='git ls-files -v | grep '^h''
alias gitaddcommitaction='gitdir=$(git rev-parse --git-dir); scp -p -P 29418 zhiwei.wang@192.168.0.56:hooks/commit-msg ${gitdir}/hooks/; git commit --amend'
alias gitaddcommitactionice='gitdir=$(git rev-parse --git-dir); scp -p -P 29418 zhiwei.wang@review-app.mythwarecm.com:hooks/commit-msg ${gitdir}/hooks/; git commit --amend'


