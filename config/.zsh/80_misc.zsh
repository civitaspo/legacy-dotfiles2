umask 022

# Ctrl + S for Vim
stty -ixon -ixoff

if has 'rbenv'; then
  eval "$(rbenv init - --no-rehash)"
fi
if has 'goenv'; then
  eval "$(goenv init - --no-rehash)"
  # NOTE: The above command does not export PATH.
  export PATH="$GOENV_ROOT/shims:$PATH"
fi
if has 'pyenv'; then
  eval "$(pyenv init - --no-rehash)"
fi
if has 'pyenv-virtualenv-init'; then
  eval "$(pyenv virtualenv-init - --no-rehash)"
fi
if has 'ndenv'; then
  eval "$(ndenv init - --no-rehash)"
fi
if has 'jenv'; then
  eval "$(jenv init - --no-rehash)"
fi
if has 'scalaenv'; then
  eval "$(scalaenv init - --no-rehash)"
fi
if has 'sbtenv'; then
  eval "$(sbtenv init - --no-rehash)"
fi

# ref. https://qiita.com/sonots/items/906798c408132e26b41c
function gcloud-activate() {
  name="$1"
  project="$2"
  echo "gcloud config configurations activate \"${name}\""
  gcloud config configurations activate "${name}"
}
function gx-complete() {
  _values $(gcloud config configurations list | awk '{print $1}')
}
function gx() {
  name="$1"
  if [ -z "$name" ]; then
    line=$(gcloud config configurations list | peco)
    name=$(echo "${line}" | awk '{print $1}')
  else
    line=$(gcloud config configurations list | grep "$name")
  fi
  project=$(echo "${line}" | awk '{print $4}')
  gcloud-activate "${name}" "${project}"
}
compdef gx-complete gx

# 1Password CLI
source $HOME/.config/op/plugins.sh
