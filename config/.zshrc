
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%s%6.}\t%N:%i>\t'
    exec 3>&2 2>/tmp/zsh.startlog.$$
    setopt xtrace prompt_subst
fi

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

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
