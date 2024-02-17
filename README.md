
# dotfiles

**Automatic install**
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MrKoopaKiller/dotfiles/HEAD/install.sh)"
```

# Manual Install
## MacOS

### Prerequisites

The packages on MacOS are managed by [Brew](https://brew.sh/) and listed in the file `Brewfile` on the root directory of this repository.  So before start, make sure brew is correct instaled and run:

```
brew bundle install
```

> EDIT the `Brewfile` to change the package selection

### Configure dotfiles

The dotfiles inside this repo are organized in a way to match with the path in the `$HOME` user directory. 

The [GNU Stow](https://www.gnu.org/software/stow/) is used to manage the dotfiles. It is already part of `Brewfile`.

Run the following command on the root directory:

```
stow .
```
It will make all the necessary links for the dotfiles on your home folder.

### Fonts
I'm using SauceCodeProNed font from [Nerdfonts](https://www.nerdfonts.com/).

For manual install, copy the files inside `/fonts` to `/Library/Fonts` or run `/fonts/fonts.sh` script.