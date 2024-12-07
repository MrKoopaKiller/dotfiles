#/usr/bin/env bash
set -u

brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
    BREW=(which brew)
}

logging() {
    echo "$(date -u +'%Y-%m-%d:%H:%M:%S UTC') - Installed" >> install.log
    touch $(date) > installed.lock
}

BREW="/opt/homebrew/bin/brew"
DOTDIR="${HOME}/dotfiles"
[ ! -f $DOTDIR/install.sh ] && git clone https://github.com/MrKoopaKiller/dotfiles.git $DOTDIR

if [[ -f "$BREW" ]]; then brew_install; fi
if [[ $(uname) == 'Darwin' ]]; then brew bundle install; fi
if [[ $(uname) == 'linux' ]]; then xargs sudo apt-get -y install < ${DOTDIR}/aptfile; fi

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Set ZSH as default
grep $(which zsh) /etc/shells
[ $? -eq 1 ] && echo $(which zsh) | sudo tee -a /etc/shells
echo "+ Setting ZSH as default shell... it might required sudo password."
sudo chsh -s $(which zsh) $USER

# Run stow
echo '+ Creating symlinks'
cd $DOTDIR && stow .
[ $? -eq 1 ] && echo "Error: Remove the refereces and try again."

# TODO: Locking file to don't install multiple times. 
logging
