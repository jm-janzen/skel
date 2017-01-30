#!/bin/zsh
# source every rc file in like named .dir

# support multiple python versions (req: pyenv package)
eval "$(pyenv init -)"

file=${HOME}/.${${(%):-%1N}#.}.dir

if [ -d $file ]; then
    for f in $file/*; do
        case $f in *~) continue;; esac
        source $f
done
fi
