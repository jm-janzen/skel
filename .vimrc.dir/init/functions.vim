" normal mode key maps
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>n :call NumberToggle()<cr> " toggle nu/rnu

