source git-completion.bash

alias ls="ls -FGksh --color=always"
alias ..="cd .. && ls"
alias python='python -u'
alias sim="export ROBOT=sim"

export SVN_EDITOR='vim'
export EDITOR='vim'
export HGMERGE='meld'
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[0;31m\]$(__git_ps1 "(%s)")\[\033[01;34m\]\$\[\033[00m\] '

