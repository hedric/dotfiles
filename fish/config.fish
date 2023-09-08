if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias bc='batcat'

alias glog='git log --oneline -n15'
alias gba='git branch --all'
alias gst='git status'
alias gri='git rebase -i'
alias gcv='git commit -v'
alias gca='git commit --amend'

set PATH $PATH ~/.cargo/bin
