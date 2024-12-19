autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

bindkey -e

DOTDIR="$HOME/dotfiles"
source $DOTDIR/.config/zsh/themes/minimal.zsh
source $DOTDIR/.config/zsh/common.zsh
source $DOTDIR/.config/zsh/aliases.zsh

if [[ $(uname) == 'Darwin' ]]; then
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
    bindkey "[D" backward-word # ALT-left-arrow  ⌥ + ←
    bindkey "[C" forward-word  # ALT-right-arrow ⌥ + →
    # FZF
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # Load auto-sugestions
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [[  $(uname) == 'Linux'  ]]; then
    # fzf
    [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] &&  source /usr/share/doc/fzf/examples/key-bindings.zsh
    [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
    # zsh-uto-sugestion
    [ ! -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

export PATH="$PATH:/Users/deoliveira/.bin"