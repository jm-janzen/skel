"""
""" golang configuration
"""

" source macros
source ${HOME}/.vimrc.dir/lang_configs/go/macros_go.vim

" don't expand tabs as spaces
set noexpandtab

"
" Highlight spaces that look like they're trying to replace tabs,
" but not too much (because of go fmt alignment)
"

set lcs=space:·,tab:>·

hi Whitespace guifg=#232323
hi custom_spaces guifg=#606060
hi custom_tabs guifg=#232323

" See :h 2match (ordered matching rules)
match custom_spaces /    \+/
2match custom_tabs /\t/
