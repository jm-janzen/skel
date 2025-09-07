#!/bin/zsh

# source every rc file in like named .dir
file=${HOME}/.${${(%):-%1N}#.}.dir

if [ -d $file ]; then
    for f in $file/*; do
        case $f in *~) continue;; esac
        source $f
done
fi



setxkbmap -option ctrl:nocaps

#
# Load zsh plugins
#

source ~/antigen.zsh

export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle kutsan/zsh-system-clipboard

antigen apply

#eval "$(zoxide init zsh)"
#eval "$(~/.local/bin/mise activate)"
