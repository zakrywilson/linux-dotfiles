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

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
