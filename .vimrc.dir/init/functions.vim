" normal mode key maps
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

" CoC expects this :shrug:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <Leader>n :call NumberToggle()<cr> " toggle nu/rnu

