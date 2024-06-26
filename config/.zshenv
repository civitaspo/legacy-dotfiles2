# NOTE: http://kiririmode.hatenablog.jp/entry/20160214/1455375600
typeset -gx -U path
path=( \
    ~/bin(N-/) \
    ~/sbin(N-/) \
    ~/scripts(N-/) \
    ~/.zplug/bin(N-/) \
    ~/.tmux/bin(N-/) \
    ~/.cargo/bin(N-/) \
    ~/.krew/bin(N-/) \
    ~/go/*/bin(N-/) \
    ~/.cargo/bin(N-/) \
    ~/.local/share/aquaproj-aqua/bin(N-/) \
    /usr/local/bin(N-/) \
    /usr/local/sbin(N-/) \
    /usr/local/share/git-core/contrib/diff-highlight(N-/) \
    /opt/homebrew/share/git-core/contrib/diff-highlight(N-/) \
    /usr/local/opt/coreutils/libexec/gnubin(N-/) \
    /usr/local/opt/gnu-sed/libexec/gnubin(N-/) \
    /usr/local/opt/findutils/libexec/gnubin(N-/) \
    /usr/local/opt/gnu-tar/libexec/gnubin(N-/) \
    /opt/homebrew/opt/*/bin(N-/) \
    /usr/local/opt/*/bin(N-/) \
    /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin(N-/) \
    /usr/sbin(N-/) \
    "$path[@]" \
    )

manpath=( \
    /usr/local/opt/coreutils/libexec/gnuman(N-/) \
    "$manpath[@]" \
    )

# NOTE: set fpath before compinit
typeset -gx -U fpath
fpath=( \
    ~/.zsh/Completion(N-/) \
    ~/.zsh/functions(N-/) \
    ~/.zsh/plugins/zsh-completions(N-/) \
    /usr/local/share/zsh/functions(N-/) \
    /usr/local/share/zsh/site-functions(N-/) \
    $fpath \
    )

# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# LANGUAGE must be set by en_US
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
export EDITOR="code --wait"
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less
# Less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# http://karur4n.hatenablog.com/entry/2016/01/18/100000
setopt no_global_rcs
# Add ~/bin to PATH
export PATH=~/bin:"$PATH"

# declare the environment variables
export CORRECT_IGNORE='_*'
export CORRECT_IGNORE_FILE='.*'

# http://zsh.sourceforge.net/Guide/zshguide04.html#l87
export WORDCHARS='*?_-.[]~!#$%^(){}<>'

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
# share history with different sessions
setopt share_history
# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

# fzf - command-line fuzzy finder (https://github.com/junegunn/fzf)
export FZF_DEFAULT_OPTS="--reverse --extended --ansi --multi"

# available $INTERACTIVE_FILTER
export INTERACTIVE_FILTER="fzf-tmux:fzf:peco"

# https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
export GPG_TTY=$(tty)

# https://github.com/b4b4r07/enhancd/issues/118
export ENHANCD_COMPLETION_BEHAVIOR=list

[[ -f ~/.secret-env.sh ]] && source ~/.secret-env.sh
. "$HOME/.cargo/env"
