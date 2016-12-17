#!/bin/zsh
# source every rc file in like named .dir

file=${HOME}/.${${(%):-%1N}#.}.dir

if [ -d $file ]; then
    for f in $file/*; do
        case $f in *~) continue;; esac
        source $f
done
fi
