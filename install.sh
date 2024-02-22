#/usr/bin/env bash

set -u

DOTDIR="${HOME}/dotfiles"
[ ! -f $DOTDIR/install.sh ] && git clone https://github.com/MrKoopaKiller/dotfiles.git $DOTDIR

if [[ $(uname) == 'Darwin' ]]; then
    # brew install
    brew bundle install
elif [[ $(uname) == 'linux' ]]; then
    # apt-get install
    xargs sudo apt-get -y install < ${DOTDIR}/aptfile
else
    echo "No custom install detect for the OS."
fi

# Set ZSH as default
grep $(which zsh) /etc/shells
[ $? -eq 1 ] && echo $(which zsh) | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# Run stow
cd $DOTDIR && stow .
[ $? -eq 1 ] && echo "Error: Remove the refereces and try again."
echo "Done"