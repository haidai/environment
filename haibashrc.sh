source ~/environment/git-completion.bash

export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[01;34m\]\$ \[\033[00m\]'

alias ls="ls -FGksh --color=always"
alias ..="cd .. && ls"
alias python='python -u'
alias v="gvim"
alias sim="export ROBOT=sim"


alias catkin_make_eclipse='cmake ../src/ -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
alias catkin_make_xcode='cmake ../src/ -G Xcode -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel'
