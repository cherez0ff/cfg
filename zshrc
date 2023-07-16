autoload -U compinit && compinit
autoload -U colors; colors
setopt SHARE_HISTORY #?
setopt HIST_EXPIRE_DUPS_FIRST  # Do not write a duplicate event to the history file
HISTFILE=$HOME/.zhistory
SAVEHIST=100000
HISTSIZE=100000
WORDCHARS='`~!@#$%^&*()-_=+[{]}\|;:",<.>/?'"'"

export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE='true'
plugins=(
  fzf
  git-extras
  kubectl
)

# Need for ruby gems to work
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:$GEM_HOME/bin"

bindkey '\e[A' history-search-backward  # autocompletion using arrow keys (based on history)
bindkey '\e[B' history-search-forward # autocompletion using arrow keys (based on history)
bindkey "^[[1;5C" forward-word # move between words with arrow keys
bindkey "^[[1;5D" backward-word # move between words with arrow keys
bindkey "^[[3;5~" delete-word # delete with Ctr+del
bindkey "^H" backward-delete-word # delete Ctr+backsapce

export PROMPT="%F{148}%~ ⇒ %f"
export EDITOR='vim'
source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc_aliases
source $HOME/.zshrc_extra 2>/dev/null
source $HOME/.zshrc_k8s 2>/dev/null
source $HOME/os/roles/zsh/files/zsh_demonslayer 2>/dev/null

