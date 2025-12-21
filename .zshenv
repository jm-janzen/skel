# https://wiki.zshell.dev/docs/guides/customization#disabling-system-wide-compinit-call-ubuntu
skip_global_compinit=1

# https://stackoverflow.com/questions/10940736/rbenv-not-changing-ruby-version
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
