
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%s%6.}\t%N:%i>\t'
    exec 3>&2 2>/tmp/zsh.startlog.$$
    setopt xtrace prompt_subst
fi

if [[ -f ~/.zplugin/bin/zplugin.zsh ]]; then
    source ~/.zplugin/bin/zplugin.zsh
    autoload -Uz _zplugin
    (( ${+_comps} )) && _comps[zplugin]=_zplugin

    for f in $(ls ~/.zsh/*.zsh); do
        zplugin snippet $f
    done
    if has 'gcloud'; then
        source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
        source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
    fi

    zplugin light zdharma/fast-syntax-highlighting
    zplugin light zsh-users/zsh-completions
    zplugin light zsh-users/zsh-autosuggestions
    zplugin light b4b4r07/emoji-cli
    zplugin light b4b4r07/enhancd
fi

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
