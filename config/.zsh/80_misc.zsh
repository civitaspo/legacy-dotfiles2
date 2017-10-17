umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

export RBENV_ROOT=$HOME/.rbenv
export GOENV_ROOT=$HOME/.goenv
export PYENV_ROOT=$HOME/.pyenv
export JENV_ROOT=$HOME/.jenv

if has 'rbenv'; then
  eval "$(rbenv init -)"
fi
if has 'goenv'; then
  eval "$(goenv init -)"
fi
if has 'pyenv'; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
if has 'ndenv'; then
  eval "$(ndenv init -)"
fi
if has 'jenv'; then
  eval "$(jenv init -)"
fi
if has 'scalaenv'; then
  eval "$(scalaenv init -)"
fi
if has 'sbtenv'; then
  eval "$(sbtenv init -)"
fi
if has $HOME/.pyenv/versions/google-cloud-sdk/bin/python2; then
  export CLOUDSDK_PYTHON=$(readlink "$HOME/.pyenv/versions/google-cloud-sdk/bin/python2")
fi
