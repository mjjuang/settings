########################
# git
########################
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='%F{#808080}%n@%~ [%D{%H:%M:%S}]%F{#00FF00}$(parse_git_branch)%f$ '

# auto-completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"


########################
# gvm
########################
[[ -s "/Users/ally/.gvm/scripts/gvm" ]] && source "/Users/ally/.gvm/scripts/gvm"


########################
# pyenv
########################
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
