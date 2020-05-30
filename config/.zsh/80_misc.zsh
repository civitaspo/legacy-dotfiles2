umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

if has 'rbenv'; then
  eval "$(rbenv init -)"
fi
if has 'goenv'; then
  eval "$(goenv init -)"
fi
if has 'pyenv'; then
  eval "$(pyenv init -)"
fi
if has 'pyenv-virtualenv-init'; then
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

