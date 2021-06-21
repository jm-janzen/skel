# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$PATH"

# Just some niceties
#feh --bg-scale ${HOME}/Pictures/boom.png
#feh --bg-scale ${HOME}/Pictures/wiz.png
#feh --bg-scale --image-bg white ${HOME}/Pictures/starkness-mono.jpg
#feh --bg-scale --image-bg white ${HOME}/Pictures/march-snow.jpg
#feh --bg-fill --force-aliasing ${HOME}/Pictures/motivation-cat.png
#feh --bg-fill --force-aliasing ${HOME}/Pictures/nope.jpg
feh --bg-scale --force-aliasing ${HOME}/Pictures/unix-magick.jpg
feh --bg-center --image-bg white ~/Pictures/unix-magick.jpg
setxkbmap -option ctrl:nocaps

export PATH="$HOME/.cargo/bin:$HOME/.screenlayout/:$PATH"

# Krew - Kubectl plugin mgr. For kubectl ctx (ultimately)
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

EDITOR=nvim
VISUAL=nvim
source "$HOME/.cargo/env"
