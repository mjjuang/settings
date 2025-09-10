# customized prompt:
unset color_prompt force_color_prompt
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w [\t]\$ '

# check the spelling for change directory (cd)
shopt -s cdspell

# for "history"
export HISTCONTROL=erasedups
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:ls -al:ll:la:cd -:cd:main:cd $WORKDIR:p4 login:p4 sync"

# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;34m'
export LESS_TERMCAP_md=$'\E[0;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[0;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[0;33m'


# enable color support of ls and also add handy aliases
eval "`dircolors -b`"
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias al='ls -al --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

#for gdbmgr
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.vim/gdbmgr/src
#export LD_PRELOAD=$LD_PRELOAD:/usr/lib/libutil.so

#other configuration
XMLLINT_INDENT=4

alias prettyjson='python -mjson.tool'
alias flushmem='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

export LFS=/mnt/lfs

########################################################################################
# functions
########################################################################################

# this function is to change the terminal title
# $ tt "workspace-term"
# or
# $ export PROMPT_COMMAND='echo -en "\033]0;terminal-title\007"'
tt()
{
  unset PROMPT_COMMAND
  echo -e "\e]2;$1\007\e]1;\007"
}

# edit file without changing its modification time
edit-notime()
{
  FILE=$1;
  TMP=`mktemp /tmp/file-XXXXXX`;
  cp -p $FILE $TMP;
  vi $TMP;
  touch -r $FILE $TMP;
  cp -p $TMP $FILE;
  rm -f $TMP;
}
