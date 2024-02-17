#/usr/bin/env bash
WORKDIR="$HOME/dotfiles"

git clone https://github.com/MrKoopaKiller/dotfiles.git $WORKDIR

# Install fonts
source fonts/fonts.sh

cd $WORKDIR && stow .

echo "Done!"