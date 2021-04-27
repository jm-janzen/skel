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
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

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
" Plug 'w0rp/ale'             " Linting

Plug 'tpope/vim-fugitive'   " Git builtin - good navigating
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


" XXX Testing lang server
" NOTE dump-ed '~/.vim/plugin/supertab.vim' to prevent confusion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'ngmy/vim-rubocop'

" Better brace indenting by default
Plug 'Vimjas/vim-python-pep8-indent'

" Preview colours in editor
Plug 'norcalli/nvim-colorizer.lua'

" Trying debugging again ...
"Plug 'eliba2/vim-node-inspect'

" colo code csv rows?
Plug 'chrisbra/csv.vim'

" Ranger fm with <leader>f
Plug 'francoiscabrol/ranger.vim'

if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'metakirby5/codi.vim'  " Show script output in sidecar REPL
  Plug 'rbgrouleff/bclose.vim' " Required by 'francoiscabrol/ranger.vim' in nvim
else
  Plug 'roxma/vim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" For nvim-colorizer
let &termguicolors=1
lua require'colorizer'.setup()

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

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

" Calculator I'm trying out...
vnoremap ;bc "ey:call CalcBC()<CR>
function! CalcBC()
  let has_equal = 0
  " remove newlines and trailing spaces
  let @e = substitute (@e, "\n", "", "g")
  let @e = substitute (@e, '\s*$', "", "g")
  " if we end with an equal, strip, and remember for output
  if @e =~ "=$"
    let @e = substitute (@e, '=$', "", "")
    let has_equal = 1
  endif
  " sub common func names for bc equivalent
  let @e = substitute (@e, '\csin\s*(', "s (", "")
  let @e = substitute (@e, '\ccos\s*(', "c (", "")
  let @e = substitute (@e, '\catan\s*(', "a (", "")
  let @e = substitute (@e, "\cln\s*(", "l (", "")
  " escape chars for shell
  let @e = escape (@e, '*()')
  " run bc, strip newline
  let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
  " append answer or echo
  if has_equal == 1
    normal `>
    exec "normal a" . answer
  else
    echo "answer = " . answer
  endif
endfunction
