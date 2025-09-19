# Skeleton configs

This is a dotfiles repo. It takes its name from /etc/skel/ which was used to set default configuration files for new users. I'm not sure if this is still used in a modern setting anywhere, but I like the name.

This repo uses [GNU stow](https://www.gnu.org/software/stow/manual/stow.html). Simply running `stow .` from this repo will make symlinks to all the files within respectively in your home directory. You can then edit the files in place to also edit the symlinked files within this repo.
