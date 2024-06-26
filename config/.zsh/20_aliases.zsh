alias ..='cd ..'
alias ls='\gls -G --color=auto'
alias ld='ls -ld'          # Show info about the directory
alias lla='ls -lAF'        # Show hidden all files
alias ll='ls -lF'          # Show long file information
alias la='ls -AF'          # Show hidden files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -p'
alias ssh='TERM=xterm ssh -A -C'
alias tmux='tmux -u'
alias sudo='sudo '

if has 'nvim'; then
    alias vim='nvim'
    alias vi='nvim'
else
    alias vi='vim'
fi

# Use if colordiff exists
if has 'colordiff'; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# http://mollifier.hatenablog.com/entry/20101227/p1
autoload -Uz zmv
alias zmv='noglob zmv -W'

alias -g F='| "$(available $INTERACTIVE_FILTER)"'

alias hosts='cat /private/etc/hosts F'

if has 'git'; then
    alias gst='git status -sb'
    alias ga='git add'
    alias gc='git commit -s -S'
    alias gsw='git switch'
    alias grs='git restore'
    alias gb='git branch'
    if has 'fzf-tmux'; then
        fzf_local_branches() {
            local branches branch
            branches=$(git branch) &&
            branch=$(echo "$branches" | fzf-tmux +m) &&
            echo "$branch" | sed "s/.* //"
        }
        fzf_remotes() {
            local remotes remote
            remotes=$(git remote) &&
            remote=$(echo "$remotes" | fzf-tmux +m) &&
            echo "$remote"
        }
        alias push='git push $(fzf_remotes) $(fzf_local_branches)'
        alias pull='git pull $(fzf_remotes) $(fzf_local_branches)'

        # https://github.com/junegunn/fzf/wiki/Examples#git
        # fsw - git switch branch/tag by fzf
        fsw() {
            local tags branches target
            tags=$(
                git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
            branches=$(
                git branch --all | grep -v HEAD             |
                sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
                sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
            target=$(
                (echo "$tags"; echo "$branches") |
                fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
            git switch $(echo "$target" | awk '{print $2}')
        }

        # fshow - git commit browser
        fshow() {
          git log --graph --color=always \
              --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
          fzf-tmux --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
              --bind "ctrl-m:execute:
                        echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                        xargs -I % sh -c 'git show --color=always % | less -R'"
        }

    fi
    if has 'perl'; then
        delete_git_merged_branch() {
            git branch --merged \
                | perl -anlpe 's/\s+//g' \
                | egrep -v '^(\*.*|develop|master|production|staging|development)$' \
                | xargs git branch -d
        }
        alias gbdm=delete_git_merged_branch
    fi
fi
if has 'gh'; then
    if has 'fzf-tmux'; then
        fzf_pr_number() {
            local pr_number
            pr_number=$(gh pr list --limit 100 | fzf-tmux +m | awk '{print $1}') &&
            echo "$pr_number"
        }
        alias ghc='gh pr checkout $(fzf_pr_number)'
    fi
fi

if has 'kubectl'; then
    alias k='kubectl'
    alias kpo='kubectl get po -A -o wide | fzf'
fi

if has 'aws'; then
    alias aws-sso-login='aws sso login --profile $(aws configure list-profiles | fzf)'
fi
