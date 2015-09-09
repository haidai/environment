source ~/environment/git-completion.bash

function abs_path {
    eval path=$1
    echo $path
}
#(cd "$(dirname '$1')" &>/dev/null && printf "%s/%s" "$PWD" "${1##*/}")

export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[01;34m\]\$ \[\033[00m\]'


alias ls="ls -FGksh"
alias ..="cd .. && ls"
alias python='python -u'
alias sim="export ROBOT=sim"
alias git_reveal='find . -type d -name ".git" -print -exec git --git-dir={} branch \;'

mkdir -p ~/.ssh
mkdir -p ~/environment
export DOCKER_DEV="-v $(abs_path ~/.ssh):/root/.ssh -v $(abs_path ~/environment):/root/environment -v $(abs_path ~/.bashrc):/root/.bashrc -v $(abs_path ~/.vimrc):/root/.vimrc"

if [ `uname` == "Darwin" ] ; then
    alias v="mvim"
    alias catkin_make_xcode='cmake ../src/ -G Xcode -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
    export ANSIBLE_HOSTS=~/ansible_hosts
    export VIM_APP_DIR=/Applications/Custom
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=$(abs_path ~/.boot2docker/certs/boot2docker-vm)
    export DOCKER_TLS_VERIFY=1
    source ~/ros_catkin_ws/install_isolated/setup.bash
else
    alias v="gvim"
    alias catkin_make_eclipse='cmake ../src/ -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel -DCMAKE_BUILD_TYPE=Debug'
    if ! type "dig" > /dev/null; then
        sudo apt-get install -y dnsutils
    fi
fi

#Prefer interface specified
if [ `uname` == "Linux" ] ; then
    export ROS_IP=`/sbin/ifconfig eth1 | grep "inet addr" | head -n 1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
elif [ `uname` == "Darwin" ] ; then
    export ROS_IP=`/sbin/ifconfig en0 | grep "inet " | awk '{print $2}'`
fi

#Fall back to addresses with 192 in it
if [ `uname` == "Linux" ] ; then
    if [ -z $ROS_IP ] ; then
        export ROS_IP=`ip addr | grep 'state UP' -A2 | grep "inet " | awk '{print $2}' | cut -f1 -d'/' | grep "192" | cut -f1 -d' '`
    fi
fi

#Fall back to dig
if [ -z $ROS_IP ] ; then
    export ROS_IP=`dig +short $(hostname)`
fi

#Fall back to any address
if [ -z $ROS_IP ] ; then
    echo "Failed to set ROS_IP with dig. Trying ip addr."
    export ROS_IP=`ip addr | grep 'state UP' -A2 | grep "inet " | awk '{print $2}' | cut -f1 -d'/' | cut -f1 -d' '`
fi

if [ -z $ROS_IP ] ; then
    echo "ROS_IP is empty!"
else
    echo "ROS_IP is $ROS_IP"
fi

export ROS_MASTER_URI=http://$ROS_IP:11311
