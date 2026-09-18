#!/bin/zsh

# source every rc file in like named .dir
file=${HOME}/.${${(%):-%1N}#.}.dir
if [ -d $file ]; then
    for f in $file/*; do
        case $f in
            *~) continue;;
            *zwc) continue;;
        esac
        source $f
done
fi

# Wayland complains if left in
setxkbmap -option ctrl:nocaps 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
