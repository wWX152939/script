# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#set alias
alias envo='cd $HOME/3rd/workplan/env'
alias workplan='cd $HOME/3rd/workplan'
alias 3rd='cd $HOME/3rd'
alias code='cd /media/truecrypt32/Project'

# set PATH so it includes user's private bin directories
#JDK
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
#export JAVA_HOME=/home/onekey/3rd/Android/jdk1.7.0_71
export JAVA_HOME=/home/onekey/3rd/Android/jdk1.8.0_201
#export JAVA_HOME=/home/onekey/3rd/Android/jdk1.8.0_102
export JRE_HOME=$JAVA_HOME/jre
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib

#AndroidSDKTOOL
export PATH=/home/onekey/3rd/Android/AndroidSDK/platform-tools:$PATH
export PATH=/home/onekey/3rd/Android/AndroidSDK/tools:$PATH

#AndroidNDK
export PATH=/home/onekey/3rd/Android/AndroidNDK:$PATH

#AndroidANT
export PATH=$HOME/3rd/Android/AndroidANT/bin:$PATH

#server adb
#export adbserver=B1120001991712118002
export adbserver=B21200019918080100F6
export PATH=$HOME/3rd/Android/AndroidANT/bin:$PATH
