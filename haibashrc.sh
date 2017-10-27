source ~/environment/git-completion.bash

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}
trap 'timer_start' DEBUG


# https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
PROMPT_COMMAND=__prompt_command
__prompt_command() {
    local EXIT="$?"
    timer_stop

    local red='\[\e[0;31m\]'
    local green='\[\e[0;32m\]'
    local color=""

    if [ $EXIT == 0 ]; then
        color="${green}"
    else
        color+="${red}"
    fi

    PS1="\n${color}"'\u@\h \@ \[\033[0;31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]\w \n'
    PS1+="${color}"'[\!] ${timer_show}s \[\033[00m\]$ '
}


#Prefer interface specified
if [ `uname` == "Linux" ] ; then
    export ROS_IP=`/sbin/ifconfig eth1 | grep "inet addr" | head -n 1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
    #Fall back to addresses with 192 in it
    if [ -z $ROS_IP ] ; then
        export ROS_IP=`ip addr | grep 'state UP' -A2 | grep "inet " | awk '{print $2}' | cut -f1 -d'/' | grep "192" | cut -f1 -d' '`
    fi
elif [ `uname` == "Darwin" ] ; then
    export ROS_IP=`/sbin/ifconfig en0 | grep "inet " | awk '{print $2}'`
fi

#Fall back to dig
if [ -z $ROS_IP ] ; then
    if ! type "dig" > /dev/null; then
        sudo apt-get install -y dnsutils
    fi
    export ROS_IP=`dig +short $(hostname)`
fi

#Fall back to any address
if [ -z $ROS_IP ] ; then
    echo "Failed to set ROS_IP with dig. Trying ip addr."
    export ROS_IP=`ip addr | grep 'state UP' -A2 | grep "inet " | awk '{print $2}' | cut -f1 -d'/' | cut -f1 -d' '`
fi

if [ -z $ROS_IP ] ; then
    if [[ $- =~ "i" ]] ; then
        echo "ROS_IP is empty!"
    fi
else
    if [[ $- =~ "i" ]] ; then
        echo "ROS_IP is $ROS_IP"
    fi
fi


export ROS_MASTER_URI=http://$ROS_IP:11311
export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'

function ros_master {
    export ROS_MASTER_URI="http://$1:11311"
}

if [ `uname` == "Darwin" ] ; then
    alias ls="ls -FGksh"
    alias v="mvim"
    alias catkin_make_xcode='cmake ../src/ -G Xcode -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
else
    alias ls="ls -FGksh --color=always"
    alias v="gvim"
    export TERM=xterm-256color
fi

alias gizlog='sudo tail -f /var/log/upstart/gizmo.log'
alias gizkill='sudo rkill -9 $(pgrep -f bin/gizmo)'
alias giz='sudo service gizmo'
alias python='python -u'
alias git_reveal='find . -type d -name ".git" -print -exec git --git-dir={} branch \;'
alias git_sub='git submodule update --init --recursive'
alias ..="cd .. && ls"
alias ...="cd ../../ && ls"
alias ....="cd ../../../ && ls"
