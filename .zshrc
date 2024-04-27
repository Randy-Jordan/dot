autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
# zstyle ':vcs_info:git:*' formats '%b'

PS1="%F{green}{%n}%F{blue}@%f%F{cyan}[%m]%f%F{magenta}%0~%f %# "

export PATH=$PATH:$HOME/sh
export PATH=$PATH:/usr/local/go/bin
alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

alias ls='ls --color=auto -h'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto -i'
alias ..='cd ..'
alias ...='cd ../..'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias c='clear'
alias untar='tar -xvf'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
