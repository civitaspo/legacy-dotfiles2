
# Use emacs mode
bindkey -e

# Enter
do-enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return
    fi

    echo
    /bin/ls -G
    zle reset-prompt
}
zle -N do-enter
bindkey '^m' do-enter

# Helper function
# use 'zle -la' option
# zsh -la option returns true if the widget exists
has_widgets() {
    if [[ -z $1 ]]; then
        return 1
    fi
    zle -la "$1"
    return $?
}

# selective ssh
fzf_ssh() {
    local hosts host
    hosts=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6-) &&
    host=$(echo "$hosts" | fzf +m)
    ssh $host
}
zle -N fzf_ssh
bindkey '^s' fzf_ssh

frepo() {
    local dir
    dir=$(ghq list > /dev/null | fzf-tmux --reverse +m) &&
      \cd $(ghq root)/$dir
#    zle reset-prompt
    zle accept-line
}
zle -N frepo
bindkey '^g' frepo
