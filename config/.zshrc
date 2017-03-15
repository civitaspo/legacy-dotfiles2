
if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=$HOME/.zsh/zplugfile
    source ~/.zplug/init.zsh
  
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

