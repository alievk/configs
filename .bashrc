# ~/.bashrc

# source global definitions
. /etc/bash/bashrc

# source git tab-completion
. ~/.git-completion.bash

# customize command line prompt
. ~/.git-prompt.sh

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]┌\[\033[00m\]{\W]\n\[\033[01;31m\]└─> \[\033[00m\] '
else
    PS1='\[\033[01;96m\]┌\[\033[00m\][\w]$(__git_ps1 " (%s)")\n\[\033[01;96m\]└─> \[\033[00m\] '
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# network commands
alias ntw='wicd-curses'

# refresh shell
alias reload='source ~/.bashrc'

# ssh commands simplified
alias relbrus='ssh alievali@elbrus'

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
