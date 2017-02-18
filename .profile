# Set proper timezone
TZ='America/Toronto'; export TZ

# Use `st' as default terminal emulator
TERM='st-256color'; export TERM

# Set default editor to vim
EDITOR='vim'; export EDITOR

# Set golang paths
export GOPATH=$HOME/trees/go          # source files
export PATH=$PATH:$GOPATH:$GOPATH/bin # binaries

# Use caps for ctrl
setxkbmap -option ctrl:swapcaps
