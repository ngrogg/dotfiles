# My ZSH config file

# Configure zsh files
## Define the place I store all my zsh config stuff
local ZSH_CONF=$HOME/.zsh

## for storing files like history and zcompdump
local ZSH_CACHE=$ZSH_CONF/cache

## Allow the local machine to have its own overriding zshrc if it wants it
local LOCAL_ZSHRC=$HOME/.zshlocal/.zshrc

# Add bin to path, to reduce aliases
PATH=~/bin:$PATH
PATH=~/.local/bin:$PATH
# For Weidu
PATH=~/local/WeiDU-Linux:$PATH

# Aliases
alias vi=vim
alias g++='g++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++20'
alias ls='ls --color=auto'
alias gits='cd ~/Documents/gits/; ls -l'
alias ll='ls -l'

# History
## Alias to show more history items
alias history='fc -fl 1'

## Keep our home directory neat by keeping the histfile somewhere else
HISTFILE=$ZSH_CACHE/history

## Big history
SAVEHIST=5000
HISTSIZE=5000

## Delete duplicate entries
HISTDUP=erase

## Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

## Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

## When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

## When duplicates are entered, get rid of the duplicates first when we hit $HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST

## Don't enter commands into history if they start with a space
setopt HIST_IGNORE_SPACE

## makes history substitution commands a bit nicer. I don't fully understand
setopt HIST_VERIFY

## Shares history across multiple zsh sessions, in real time
setopt SHARE_HISTORY

## Do not write events to history that are duplicates of the immediately previous event
setopt HIST_IGNORE_DUPS

## Add commands to history as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

# Configure terminal
## Terminal title
print -n '\e]2;Happy Little Terminal\a'

# Prompt color and formatting
## Load vcs for showing current branch
autoload -Uz vcs_info

## Load before showing prompt
precmd () { vcs_info }

## Show git status %s Begin color %F current branch %b end color %f
zstyle ':vcs_info:git:*' formats ' %s(%F{yellow}%b%f)'

## Set up the prompt with git branch name
setopt PROMPT_SUBST

## Needed for multiline $ Begin color %F{} Filepath %~ end color %f Show git info $_vcs_info_msg_0_ newline \n Prompt character %#
PROMPT=$'%F{cyan}%~%f$vcs_info_msg_0_ \n%# '

# Configure menu
## Autoload command completion
autoload -Uz compinit && compinit

## Set up menu
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

## Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
