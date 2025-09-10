# Skeleton configs

This is a dotfiles repo. It takes its name from /etc/skel/ which was used to set default configuration files for new users. I'm not sure if this is still used in a modern setting anywhere, but I like the name.

### Copy over files as needed

It's unlikely you want will want to copy all the files exactly as-is, so instead just grab what you like. The vim and zsh configurations are designed to work holistically with like-named `.vimrc.dir/*` and `.zshrc.dir/*` files, so the following is a good start:

```shell
cp -a .zsh* ~/
cp -a .vim* ~/
cp -a .config/polybar
```

### Some notes on usability

This repo is designed to sit at ~/skel, where it's used to keep track of configuration changes with the `skel` [alias](./.zshrc.dir/_aliases). For example:

```shell
skel diff ~/vim* # See vim config changes
skel add --patch ~/.config/polybar # Interactively stage polybar changes
skel log # And so on; you get it
```

You'll want to use paths starting with `~` to avoid confusion with local files. You'll also really want to edit ~/skel/.git/config according to the note [here](.gitignore) here, so you don't get swamped with untracked files in your terminal when you run `skel status`.

Also note that if you, like, `git -C ~/skel diff` (or the like), then you'll notice that the local versions here are out of the sync with the changes you've registered via `skel` commands. You can safely ignore the changes in in this actual repo, or run `git checkout` to clear them out.

If you know of a better way to do this let me know. I know I could go fully immutable, or leverage Vagrant, and maybe I will. Anyway, happy to swap ideas. Hopefully this repo has been fun to look over for someone other than me!
