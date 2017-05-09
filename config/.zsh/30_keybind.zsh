
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
    host=$(echo "$hosts" | fzf-tmux)
    if [[ -z "$host" ]]; then
        return
    fi
    if zle; then
      BUFFER="ssh $host"
      CURSOR=$#BUFFER
      zle clear-screen
    else
      print -z "ssh $host"
    fi
}
zle -N fzf_ssh
bindkey '^s' fzf_ssh

frepo() {
    local dir
    dir=$(ghq list > /dev/null | fzf-tmux +m) &&
      \cd $(ghq root)/$dir
    zle accept-line
}
zle -N frepo
bindkey '^g' frepo

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
