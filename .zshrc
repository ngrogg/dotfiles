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

# Aliases
alias vi=vim
alias ls='ls --color=auto'
alias :q='exit'
alias gits='cd ~/Documents/gits/; ls -l'
alias F="echo 'Respect paid'"
alias ll='ls -l'

# History
alias history='fc -fl 1'
# Keep our home directory neat by keeping the histfile somewhere else
HISTFILE=$ZSH_CACHE/history

## Big history 
SAVEHIST=10000
HISTSIZE=10000

# Set ZSH options
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

## Set autocd, don't need to type 'cd' anymore
setopt autocd

# Configure terminal
## Terminal title
print -n '\e]2;Happy Little Terminal\a'

## Export $TERM for lightline
export TERM=xterm

## Prompt color
PROMPT='%F{cyan}%1~%f %# '

## Command completion
autoload -Uz compinit
compinit

# Configure menu
## Set up menu
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

## Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
