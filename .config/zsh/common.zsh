zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*'

export LC_ALL=en_US.UTF-8

# History settings
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt NO_NOMATCH
setopt AUTOCD

export WORDCHARS=''
export CLICOLOR=1
export BLOCK_SIZE=human-readable
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/.zsh_history

# Colors aliases 
Red='\033[0;31m'
URed='\033[4;31m' 
Yellow='\033[1;33m'
UYellow='\033[4;33m'
Green='\033[1;32m'
UGreen='\033[4;32m'
NoColor='\033[0m'

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice lucid wait'0'
# zinit light joshskidmore/zsh-fzf-history-search
# fast-theme base16 # Change syntax-highlight color schema

# TMUX plugin manager
  if [[ ! -f $HOME/.tmux/plugins/tpm/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi

# Fzf settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
export FZF_DEFAULT_OPTS="--height 40% --inline-info"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -p --color always -r :50 {}'"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'eza -TF {} | head -50'"

# Other exports
export AWS_PAGER=""
export PATH=${PATH}:${HOME}/bin

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Yubikey
export AWS_VAULT_PROMPT=ykman ; export AWS_VAULT_KEYCHAIN_NAME=login