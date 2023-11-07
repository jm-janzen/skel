"""
""" ruby configuration
"""

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" autocomplete closing curly
"inoremap {\| {\|\|<C-o>i

inoremap #{ #{}<C-o>i

" Define method shortcut
let @d = 'odef

" Log shortcut
let @l = 'oputs '