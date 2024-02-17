
fpath+=("$(brew --prefix)/share/zsh/site-functions")

bindkey "[D" backward-word # ALT-left-arrow  ⌥ + ←
bindkey "[C" forward-word  # ALT-right-arrow ⌥ + →

# Load auto-sugestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh