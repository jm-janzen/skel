" the following are required to use vundle plugin manager
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'psliwka/vim-smoothie' " Smooth scrolling on <C-(u|d)> jump

if has('nvim')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " To edit text input using nvim in Firefox
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  "Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
endif

" Activate with `vim --cmd 'let writing_mode=1'`
if exists('writing_mode')
    Plug 'dpelle/vim-LanguageTool'
    Plug 'ron89/thesaurus_query.vim'
    Plug 'reedes/vim-pencil'
    Plug 'reedes/vim-wordy'

    Plug 'junegunn/limelight.vim'
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    Plug 'junegunn/goyo.vim'
    nnoremap <Leader>g :Goyo<CR>
    let g:goyo_width = 120
    " Toggle Limelight & Pencil with Goyo
    function! s:goyo_enter()
        :Limelight
        ":Pencil
    endfunction
    function! s:goyo_leave()
        :Limelight!
        ":NoPencil
    endfunction
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    " Launch Goyo immediately
    au VimEnter * Goyo

else

" Go ace templating highlighting
Plug 'yosssi/vim-ace'

" Experimenting with web/html plugins
" "C-y," to complete elems -- super cool
Plug 'mattn/emmet-vim'

" Resize splits on <C-w> navigation
"Plug 'camspiers/animate.vim' XXX This is messing with nerdtree
Plug 'camspiers/lens.vim'
let g:lens#width_resize_max = 80
let g:lens#disabled_filetypes = ['netrw', 'fzf', 'undotree', 'nerdtree']
let g:lens#disabled_buftypes = ['terminal', 'nerdtree']

" Language agnostic basics
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_diff_args = '-w'  " Ignore whitespace

" THE lsp completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc config (it's big)
source ~/.vimrc.dir/init/_plugin.coc.vim

" Navigating between kitty and vim splits
Plug 'knubie/vim-kitty-navigator'

endif

call plug#end()
