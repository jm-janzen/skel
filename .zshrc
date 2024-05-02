#!/bin/zsh

# source every rc file in like named .dir
file=${HOME}/.${${(%):-%1N}#.}.dir

if [ -d $file ]; then
    for f in $file/*; do
        case $f in *~) continue;; esac
        source $f
done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ] && source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && nvm use default &> /dev/null

setxkbmap -option ctrl:nocaps

source ~/antigen.zsh
#antigen bundle zsh-autosuggestions
#antigen bundle unixorn/fzf-zsh-plugin@main
#antigen bundle zsh-users/zsh-completions

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export HUSKY=0
export DENO_INSTALL="/home/jm/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
