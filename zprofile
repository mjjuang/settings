########################
# zsh
########################
#setopt correct

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTORY_IGNORE='([bf]g *|cd ..|ls)'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ls='ls -G'
alias ll='ls -l -G'
alias grep='grep --color=auto --exclude-dir=venv --exclude-dir=.git --exclude-dir=.venv --exclude-dir=.drone-cache'

alias prettyjson='python -mjson.tool'

alias rebase='git checkout master && git pull && git checkout - && git rebase master'

# run the previous command until succeeds.
alias rr='while [ $? -ne 0 ]; do eval $(history -p !!); done'

#other configuration
XMLLINT_INDENT=4

########################
# brew
########################
eval "$(/opt/homebrew/bin/brew shellenv)"

########################
# git
########################
alias log5='git log -5 --oneline'
alias log10='git log -10 --oneline'
