
" Space key in Normal - do nothing (use this as my Leader)
nmap <Space> <Nop>

"
" Movement
"

" Move around windows without C-a first
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l


"
" Editing
"
noremap <Left>    :echo 'TODO: Left'<CR>
noremap <Right>   :echo 'TODO: Right'<CR>
"XXX Prevents scrolling
"noremap <Up>      :echo 'TODO: Up'<CR>
"noremap <Down>    :echo 'TODO: Down'<CR>

" Move visually select lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" autocomplete closing curly
imap {<Enter> {<Enter>}<Esc>O
"imap ({<Enter> ({<Enter>})<Esc>O

"
" Util/Meta
"

" refresh .vimrc
nnoremap <C-s> :source $MYVIMRC<CR>

" alt+w to toggle line wrapping (all splits in win)
nnoremap <M-w> :windo set wrap!<CR>

" toggle highlight on search
nnoremap <Leader>l :set hls!<CR><C-l>

" C-l to go back to normal from other modes
imap <C-l> <Esc>
vmap <C-l> <Esc>
omap <C-l> <Esc>
lmap <C-l> <Esc>
tmap <C-l> <Esc>
cmap <C-l> <Esc>

" prevent mouse single/double-click from moving cursor
"nmap <LeftMouse> <nop>
"imap <LeftMouse> <nop>
"vmap <LeftMouse> <nop>
"nmap <2-LeftMouse> <nop>
nmap <ScrollWheelUp> echo 'foo'<CR>

"        Return to save current buffer,
" Leader,Return to save all buffers
nmap <CR> :w<CR>
nmap <Leader><CR> :wa<CR>

" Leader,q to quit current buffer
" Leader,z to write out of current buffer
nmap <Leader>q :q<CR>
nmap <Leader>z :wq<CR>

"
" Weird
"

"noremap <C-n> :20sp ~/.vim/notes.txt<CR>

" rm Windows line terminators, trailing whitespace (ew)
" FIXME This breaks when run from mapping for some reaso
"nnoremap <C-b> :%s/\v[\ ]+$//<CR>

" (insert) bind omnifunc to Ctrl+Space
inoremap <C-Space> <C-x><C-o>

" Execute current file
nnoremap <silent> <F5> :!./%<CR>

" \,s to open config dir for editing, placing cursor at start
nmap <Leader>s :tabe ~/.vimrc.dir/init<CR>:5<CR>

" insert mode key maps
" don't auto-indent `#' comments to beginning of line
inoremap # X#

"
" Plugin-specific
"

noremap <C-Up> :GitGutterPrevHunk<CR>
noremap <C-Down> :GitGutterNextHunk<CR>
noremap <C-Left> :GitGutterUndoHunk<CR>
noremap <C-Right> :GitGutterStage<CR>

map <Leader>u :UndotreeToggle \| :UndotreeFocus<CR>

" shortcut to toggle :NERDTree plugin
"nmap <silent> <C-t> :25Lexplore<CR>
"nmap <silent> <C-t> :NERDTreeToggle<CR>
" NERDTree is dead long live CHADtree
nmap <silent> <C-t> :CHADopen<CR>

nmap <Leader>b :Buffers<CR>

" 'voldikss/vim-floaterm'
let g:floaterm_keymap_toggle = '<F12>'
