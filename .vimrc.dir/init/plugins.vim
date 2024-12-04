" the following are required to use vundle plugin manager
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Language specific
Plug 'pangloss/vim-javascript'
" Need to override 4 space indents here
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

" Language agnostic basics
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', 'node_modules']

Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_diff_args = '-w'  " Ignore whitespace
"set updatetime=250
"let g:gitgutter_max_signs = 500
"" No mapping
"let g:gitgutter_map_keys = 0
"" Colors
"let g:gitgutter_override_sign_column_highlight = 0
"hi clear SignColumn
"hi GitGutterAdd ctermfg=2
"hi GitGutterChange ctermfg=3
"hi GitGutterDelete ctermfg=1
"hi GitGutterChangeDelete ctermfg=4

"Plug 'puremourning/vimspector' "TODO setup https://puremourning.github.io/vimspector-web/demo-setup.html

Plug 'davidhalter/jedi'     " Great completion for python class methods, etc
Plug 'isRuslan/vim-es6'     " Modern NodeJS autocompletion

Plug 'psliwka/vim-smoothie' " Smooth scrolling on <C-(u|d)> jump

" Auto documentation on <leader>d, other things probably
" Might have to manually do `:call doge#install()' if doesn't work
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Resize splits on <C-w> navigation
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
let g:lens#width_resize_max = 200
let g:lens#disabled_filetypes = ['netrw', 'fzf', 'undotree', 'nerdtree']
let g:lens#disabled_buftypes = ['terminal', 'nerdtree']


Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Better brace indenting by default
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'voldikss/vim-floaterm'

if has('nvim')

  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  let g:chadtree_settings = { 'theme.icon_glyph_set': 'ascii', 'view.width': 30, 'ignore': {'name_glob': ["*.log"], 'name_exact': ["__init__.py", "__pycache__", "node_modules"] }}

  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'junegunn/fzf.vim' " FIXME Remove if no longer nessa
  Plug 'rbgrouleff/bclose.vim' " Required by 'francoiscabrol/ranger.vim' in nvim
  " Ranger fm with <leader>f
  Plug 'francoiscabrol/ranger.vim'

  "
  " Perhaps a Coc replacement ... ?
  "
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

  " lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  " Need to **configure separately**

  " Preview colours in editor
  " XXX Can't remember what this does...
  Plug 'norcalli/nvim-colorizer.lua'

  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
  let g:coq_settings = { "keymap.recommended": v:false }
else
  " FIXME Don't remember why I included these
  "Plug 'roxma/vim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
endif

" Colourscheme plugins:
Plug 'kadekillary/skull-vim' " :colo skull


call plug#end()

" For nvim-colorizer
"let &termguicolors=1
"lua require'colorizer'.setup()

"
" XXX Example coc config
"

" Ruby lang server
let g:coc_global_extensions = ['coc-solargraph']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" XXX This is most probably getting overriden elsewhere
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-b>"
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-f>"
