" Grabbed from https://gitlab.com/egzvor/vimfiles/-/tree/b3f6916ae9b639e0914b136a7d53f86abeca12ba/ftplugin

" Use antigen kutsan/zsh-system-clipboard to share clipboard
" between yank and zsh vi mode paste buffer

setl signcolumn=no
setl nolist
setl laststatus=0
setl scrolloff=0
setl nowrapscan
setl nobuflisted
setl buftype=nofile
setl bufhidden=wipe
setl relativenumber

noswapfile

" Place cursor at last non-whitespace character
" (for new-ish terminal buffers with text at top)
call cursor(line('$'), 0)
call search('\S', 'b')
