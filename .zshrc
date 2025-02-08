autoload -Uz vcs_info # Version Control Info
precmd_vcs_info() { vcs_info } #
precmd_functions+=( precmd_vcs_info ) #
setopt prompt_subst # String Substitution 
RPROMPT='${vcs_info_msg_0_}' # Git Status
zstyle ':vcs_info:git:*' formats '%b' #Display only branch name.

# Left Prompt n=User f=Host %0~=cwd %#=Permission Symbol
PS1="%F{green}{%n}%F{blue}@%f%F{cyan}[%m]%f%F{magenta}%0~%f %# "

export PATH=$PATH:$HOME/sh
export PATH=$PATH:/usr/local/go/bin

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_DATA_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias ls='ls --color=auto -h'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto -i'
alias ..='cd ..'
alias ...='cd ../..'
alias mvi='mv -i'
alias cpi='cp -i'
alias rmi='rm -i'
alias rmdir='rm -rfv'
alias c='clear'
alias untar='tar -xvf'
alias del='shred -n 10 -u -z'
alias gpgk='gpg --list-keys --keyid-format=long'
alias gpgpub='gpg --armor --export'
alias mirror='wget -mpEk'
alias wpage='wget -E -H -k -K -p'
alias encrypt='gpg -r randyjordan@email.com -e'

function init_tmux()
{
# Start the tmux session if not alraedy in the tmux session
if [[ ! -n $TMUX  ]]; then
  # Get the session IDs
  session_ids="$(tmux list-sessions)"

  # Create new session if no sessions exist
  if [[ -z "$session_ids" ]]; then
    tmux new-session
  fi

  # Select from following choices
  #   - Attach existing session
  #   - Create new session
  #   - Start without tmux
  create_new_session="Create new session"
  start_without_tmux="Start without tmux"
  choices="$session_ids\n${create_new_session}:\n${start_without_tmux}:"
  choice="$(echo $choices | fzf | cut -d: -f1)"

  if expr "$choice" : "[0-9]*$" >&/dev/null; then
    # Attach existing session
    tmux attach-session -t "$choice"
  elif [[ "$choice" = "${create_new_session}" ]]; then
    # Create new session
    tmux new-session
  elif [[ "$choice" = "${start_without_tmux}" ]]; then
    # Start without tmux
    :
  fi
fi
}
init_tmux
