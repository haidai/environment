source ~/environment/git-completion.bash

function abs_path {
  (cd "$(dirname '$1')" &>/dev/null && printf "%s/%s" "$PWD" "${1##*/}")
}

export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[01;34m\]\$ \[\033[00m\]'

export ROS_IP=`/sbin/ifconfig en0 | grep "inet " | awk '{print $2}'`
export ROS_MASTER_URI=http://$ROS_IP:11311

alias ls="ls -FGksh"
alias ..="cd .. && ls"
alias python='python -u'
alias v="mvim"
alias sim="export ROBOT=sim"
alias git_reveal='find . -type d -name ".git" -print -exec git --git-dir={} branch \;'

alias catkin_make_eclipse='cmake ../src/ -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel -DCMAKE_BUILD_TYPE=Debug'
alias catkin_make_xcode='cmake ../src/ -G Xcode -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'

unamestr=`uname`
if [ "$unamestr" == "Darwin" ] ; then
    export ANSIBLE_HOSTS=~/ansible_hosts
    export VIM_APP_DIR=/Applications/Custom
    export DOCKER_DEV="-v $(abs_path ~/.ssh):/root/.ssh -v $(abs_path ~/environment):/root/environment"
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=$(abs_path ~/.boot2docker/certs/boot2docker-vm)
    export DOCKER_TLS_VERIFY=1
fi

source ~/ros_catkin_ws/install_isolated/setup.bash
