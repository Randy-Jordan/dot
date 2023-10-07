
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
# zstyle ':vcs_info:git:*' formats '%b'

PS1="%F{green}{%n}%F{blue}@%f%F{cyan}[%m]%f%F{magenta}%0~%f %# "

alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

