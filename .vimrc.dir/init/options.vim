set list lcs=trail:-,tab:>· " show training whitespace as `-', and tabs as `>---'
set list
set incsearch   " highlight search results as they are being typed
set hlsearch    " highlight search results
set shiftround  " shift to set columns rather than relative
set si          " use smartindent on new lines (see ':help smartindent')
set cinkeys-=0#
set indentkeys-=0#
set ai          " use autoindent (copy indent from prev line on new line)
set cursorline  " highlight current line (expensive)
set nu          " show line numbers by default
set clipboard+=unnamedplus  " copy yank to primary (<C-c>) clipboard

let mapleader = " "

"hi,
"here is a basic .vimrc that you can choose to use if you like.  use all/part/none of it up to you.
" Ty

" ignore case during search
set ignorecase

" obey case if search pattern has uppercase
set smartcase

" shiftwidth is 4 @ sparq
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" fileformats=unix
set ffs=unix

filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

" we use a dark terminal background provide appropriate colours
set background=dark

" allow syntax highlighting
syntax on
syntax enable

" turn on:
"   1) Filetype detection
"   2) Use filetype plugins
"   3) Use filetype specific indenting
filetype plugin indent on

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line (see ":help statusline")
"   \       a space
"   %F      path from home
"   %f      path for file in buffer
"   %m      modified? [+], not-modifiable? [-]
"   %r      readonly? [RO]
"   %h      is vim help? [help]
"   %w      is preview? [Preview]
"   %l      line
"   %c      column
set statusline=\ %y\ %F%m%r%h\ %w\ pos:\(l:%l,c:%c,b:%n)

" code folding
set foldmethod=syntax
set foldlevelstart=99 " open all folds on file open

" track undo changes in dedicated folder
if has ("persistent_undo")
    silent !mkdir -pv ~/.vim/undo
    set undofile
    set undodir=$HOME/.vim/undo  " where to save (REQ: `mkdir ~/.vim/undo`!)
endif

" try really hard to allow 256 colos
set t_Co=256

" default colorscheme
colorscheme 256-noir "bink-arvo

autocmd FileType netrw set nolist

" Enhance netrw
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
