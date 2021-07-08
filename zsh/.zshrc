# ZSH CONFIG

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Colors for prompt
autoload -U colors && colors
#export PS1=[$fg[blue]%M$fg[white]@$fg[green]%n%{$reset_color%}]" %~ "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# ZSH_AUTOSUGGEST_USE_ASYNC=1

# vi mode
bindkey -v
# Faster vi mode transitions
export KEYTIMEOUT=1

# For better tab completion with commands
# Tab twice to list
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
__comp_options+=(globdots)

# Git branch in right prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%b"
precmd() {
    vcs_info
}
# Enable substitution in the prompt.
setopt prompt_subst

PROMPT='[%F{green}%n%f@%F{magenta}%m%f]%F{blue}%B%~%b%f$ '
RPROMPT='[%F{yellow}${vcs_info_msg_0_}%f]'

# Aliases
alias l='ls -l --color=auto'
alias ll='ls -lah --color=auto'
alias gru='git remote update --prune'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch --all'
alias gst='git status'
alias glog='git log --oneline'
alias gdiff='git diff-tree --no-commit-id --name-only -r'

alias ..='cd ..'

#
# Created by newuser for 5.7.1
fpath+=${ZDOTDIR:-~}/.zsh_functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Key binds
bindkey '^@' autosuggest-accept

PATH="$HOME/.local/bin:$PATH"
