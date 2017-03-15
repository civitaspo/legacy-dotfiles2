umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

export RBENV_ROOT=$HOME/.rbenv
export GOENV_ROOT=$HOME/.goenv
export PYENV_ROOT=$HOME/.pyenv

eval "$(rbenv init -)"
eval "$(goenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

