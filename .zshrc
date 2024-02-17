echo "zshrc"
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

bindkey -e

DOTDIR="$HOME/dotfiles"
source $DOTDIR/.config/zsh/themes/minimal.zsh
source $DOTDIR/.config/zsh/common.zsh
source $DOTDIR/.config/zsh/aliases.zsh

if [[ $(uname) == 'Darwin' ]]; then
    [[ -f $DOTDIR/MacOS.zsh ]] && source $DOTDIR/MacOS.zsh
else
    [[ -f $DOTDIR/Linux.zsh ]] && source $DOTDIR/Linux.zsh
fi