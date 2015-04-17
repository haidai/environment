source ~/environment/git-completion.bash

export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[01;34m\]\$ \[\033[00m\]'
export ROS_IP=`/sbin/ifconfig en0 | grep "inet addr" | head -n 1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
export ROS_MASTER_URI=http://$ROS_IP:11311

alias ls="ls -FGksh"
alias ..="cd .. && ls"
alias python='python -u'
alias v="mvim"
alias sim="export ROBOT=sim"

#alias catkin_make_eclipse='cmake ../src/ -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
alias catkin_make_eclipse='cmake ../src/ -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel -DCMAKE_BUILD_TYPE=Debug'
alias catkin_make_xcode='cmake ../src/ -G Xcode -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
export ANSIBLE_HOSTS=~/ansible_hosts
export VIM_APP_DIR=/Applications/Custom

source ~/ros_catkin_ws/install_isolated/setup.bash
source ~/Work/Code/vcs/turtlebot/devel/setup.bash
source ~/Work/Code/vcs/robot2020/devel/setup.bash
alias ssh_buddy="ssh hsk1pal@192.168.1.146 -X"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/hainguyen/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
