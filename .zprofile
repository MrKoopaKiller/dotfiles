# Load Brew 
set -x
if [[ $(uname) == 'Darwin' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ $(uname) == 'Linux' ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Default Editor
export EDITOR=nvim