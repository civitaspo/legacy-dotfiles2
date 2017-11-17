umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

export RBENV_ROOT=$HOME/.rbenv
export GOENV_ROOT=$HOME/.goenv
export PYENV_ROOT=$HOME/.pyenv
export NDENV_ROOT=$HOME/.ndenv
export JENV_ROOT=$HOME/.jenv

if has 'rbenv'; then
  # For performance: eval "$(rbenv init -)"
  source $RBENV_ROOT/completions/rbenv.zsh
fi
if has 'goenv'; then
  # For performance: eval "$(goenv init -)"
  source $GOENV_ROOT/completions/goenv.zsh
fi
if has 'pyenv'; then
  # For performance: eval "$(pyenv init -)"
  # For performance: eval "$(pyenv virtualenv-init -)"
  source $PYENV_ROOT/completions/pyenv.zsh
fi
if has 'ndenv'; then
  # For performance: eval "$(ndenv init -)"
  source $NDENV_ROOT/completions/ndenv.zsh
fi
if has 'jenv'; then
  # For performance: eval "$(jenv init -)"
  source $JENV_ROOT/completions/jenv.zsh
fi
if has 'scalaenv'; then
  # For performance: eval "$(scalaenv init -)"
fi
if has 'sbtenv'; then
  # For performance: eval "$(sbtenv init -)"
fi
if has $HOME/.pyenv/versions/google-cloud-sdk/bin/python2; then
  export CLOUDSDK_PYTHON=$(readlink "$HOME/.pyenv/versions/google-cloud-sdk/bin/python2")
fi
