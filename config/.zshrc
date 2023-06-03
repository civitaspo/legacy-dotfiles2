PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%s%6.}\t%N:%i>\t'
    exec 3>&2 2>/tmp/zsh.startlog.$$
    setopt xtrace prompt_subst
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    # https://github.com/zdharma-continuum/zinit
    for f in $(ls ~/.zsh/*.zsh); do
        zinit snippet $f
    done
    zinit load zdharma-continuum/fast-syntax-highlighting
    zinit load zsh-users/zsh-completions
    zinit load zsh-users/zsh-autosuggestions
    zinit load b4b4r07/emoji-cli
    zinit load b4b4r07/enhancd
fi

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

