# Set proper timezone
TZ='America/Toronto'; export TZ

# Set default editor to vim
EDITOR='vim'; export EDITOR

# Set golang paths
export GOPATH=$HOME/trees/go        # source files
export GOBIN=$GOPATH/bin            # binaries
export PATH=$PATH:$GOPATH:$GOBIN    # add to path

# If ~/scripts exists, add it to path.
SCRIPTS_REPO="$HOME/scripts"
if [ -d $SCRIPTS_REPO ]; then
    export PATH="$PATH:$SCRIPTS_REPO"
fi

# Use caps for ctrl
setxkbmap -option ctrl:swapcaps
