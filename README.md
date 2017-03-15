.dotfiles
=========

# Installation

1. Setup your ssh key for `git clone`.
1. execute `./install.sh`.

# Rules

## mac

- For updating `.Brewfile`, execute `brew bundle dump --force --global`.
- For removing unmanaged packages, execute `brew bundle cleanup --global`.
- Applications installed from Mac App Store or `brew cask` are managed only by Brewfile, not `package` resource.
