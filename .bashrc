export PS1="\w $ "

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   eval "`dircolors -b`"
   alias ls='ls --color=auto'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -G'
alias la='ls -A'
alias ll='la -lh'
alias l='ls -CF'

# other aliases
alias h='history'
alias dk='docker'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

# have svn use emacs as editor
export SVN_EDITOR=emacs

# mvn aliases
alias mci='mvn clean install'
alias mcint='mvn -Dmaven.test.skip clean install'

# git aliases
alias g='git'
alias gb='git ba'
alias gl='git lg'
alias gs='git s'
alias gco='git co'

export PATH=$PATH:/usr/local/mysql/bin/
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/usr/local/sbin/

# Amazon Web Services Stuff
# source ~/.aws

# Add my bin dir to path
export PATH=~/bin:$PATH

source ~/env/.git-completion.bash
# I need these in order to make work git-completion work with git aliases set above
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_checkout gco

# Show git branch on terminal prompt
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\w \[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=$HOME/local/bin:$PATH

# Node.js
export PATH=$HOME/local/node/bin:$PATH

#TestFlight setup
export TESTFLIGHT_API_TOKEN=dee5bf50bdff9f89b3dbd735ba52ff99_ODYzNjE 
export IOS_RELEASE_EDITOR=emacs

export ANDROID_HOME=/Users/chris.kimm/software/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Haskell stuff
export PATH=$HOME/Library/Haskell/bin:$PATH

# Node Version Manager
# . ~/software/nvm/nvm.sh

# add redis-cli to path
export PATH=/usr/local/redis/bin:$PATH

# add protoc to path
export PATH=/Users/chriskimm/software/protoc/bin:$PATH

# add maven to path
export PATH=/Users/chriskimm/software/apache-maven-3.6.0/bin:$PATH

# Go support
export GOROOT=/usr/local/go
export GOPATH=/Users/chriskimm/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# Postgresql
export PATH=$PATH:/Library/PostgreSQL/10/bin

# Project-based aliases
alias mmcd='cd ~/go/src/github.com/chriskimm/majesticmouse'
alias mmpg='psql -h localhost -U postgres --password'

# ocaml support
eval `opam config env`

export CAML_LD_LIBRARY_PATH=/Users/chriskimm/.opam/4.07.1/lib/stublibs
