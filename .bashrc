# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment, only add if not already present
for dir in "$HOME/.local/bin" "$HOME/bin"; do
    case ":$PATH:" in
        *":$dir:"*) ;;
        *) PATH="$dir:$PATH" ;;
    esac
done

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Functions
## Function to update git repos
function update-git-repos {
    current_dir=$(pwd)
    cd ~/Documents/gits
    for dir in $(ls); do
        cd $dir
        git pull
        cd ..
    done
    cd $current_dir
}

## Function to update Fedora Atomic system
function update-system {
    rpm-ostree upgrade
    flatpak update --assumeyes
    flatpak uninstall --unused
}

# Direct SSH clients to configured ssh agents
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# History configurations
## Increase history limits
export HISTSIZE=50000
export HISTFILESIZE=100000

## Avoid duplicate lines and lines starting with spaces in history
export HISTCONTROL=ignoredups:erasedups

## Adds timestamps to commands displayed by history
HISTTIMEFORMAT='%F %T '

## Append to the history file rather than overwriting it upon exit
shopt -s histappend

## Attempts to save multiline commands as a single history entry
shopt -s cmdhist

# Shell behavior configurations
## Automatically update window size after each command
shopt -s checkwinsize

## Prevents an empty command line from triggering filename completion
shopt -s no_empty_cmd_completion
