" 1 to 3 spaces
hi Whitespace guifg=#333333

" 4+ spaces, or tab
hi custom_spaces guifg=#505050
hi custom_tabs guifg=#505050

" See :h 2match (ordered matching rules)
match custom_spaces /    \+/
2match custom_tabs /\t/

" Make trailing whitespace pop
" TODO Don't apply this in normal mode
"hi trailing_spaces guifg=red
"hi trailing_tabs guibg=red
match trailing_spaces /\s\+$/
2match trailing_tabs /\t\+$/

" https://stackoverflow.com/a/48940543
au BufWinEnter <buffer> match Error /\s\+$/
au InsertEnter <buffer> match Error /\s\+\%#\@<!$/
au InsertLeave <buffer> match Error /\s\+$/
au BufWinLeave <buffer> call clearmatches()
