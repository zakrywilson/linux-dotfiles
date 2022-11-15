#!/bin/bash

###############################################################################
#
# Zshrc (zachjwilson)
#
###############################################################################



##############################################################################
# Functions
##############################################################################


###############################################################################
# My Configuration
###############################################################################

# Use U.S. English and UTF-8
export LANG=en_US.UTF-8

# VIM - Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# VIM - Make VIM the default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# VIM - Disable CTRL-S causing editor to hang
stty -ixon

# Golang - Set path
export GOPATH=$HOME/go
export PATH=$PATH:"/usr/lib/go-1.11/bin"

# https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on branch %b'

autoload -U select-word-style
select-word-style bash

# Local bin
export PATH=$PATH:"$HOME/.local/bin"

setopt PROMPT_SUBST
PROMPT='%F{white}╭─ %F{blue}%~ %F{green}${vcs_info_msg_0_} %F{white}
╰>%F{default} '

# Share history
setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Bash-style Emacs key commands
# https://unix.stackexchange.com/a/392199
autoload -U select-word-style
select-word-style bash

# Use Emacs
bindkey -e

# Enable auto cd
setopt auto_cd

# Load external configuration
source ~/.aliases

# NVM for Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF
## Bindings
fzf_bindings="/usr/share/doc/fzf/examples/key-bindings.zsh"
[ -f $fzf_bindings ] && source $fzf_bindings
## Colors: https://gist.github.com/ctrlmaxdel/fbcb105a1c996993c60ab991ca5a2774
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Remove duplicates from the path
export PATH="$(echo "$PATH" |/bin/awk 'BEGIN{RS=":";} {sub(sprintf("%c$",10),"");if(A[$0]){}else{A[$0]=1; printf(((NR==1)?"":":")$0)}}')";
