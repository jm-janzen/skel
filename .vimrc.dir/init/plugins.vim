" the following are required to use vundle plugin manager
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'psliwka/vim-smoothie' " Smooth scrolling on <C-(u|d)> jump

if has('nvim')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
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
        :Pencil
    endfunction
    function! s:goyo_leave()
        :Limelight!
        :NoPencil
    endfunction
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

    " Launch Goyo immediately
    au VimEnter * Goyo

else

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
let g:coc_disable_startup_warning = 1 " XXX Temp

" Navigating between kitty and vim splits
Plug 'knubie/vim-kitty-navigator'
"
" coc config
"

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

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
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

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

endif

call plug#end()
