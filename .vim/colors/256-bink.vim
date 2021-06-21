" Vim color file
" Name:       256_noir.vim
" Maintainer: Andreas van Cranenburgh <andreas@unstable.nl>
" Homepage:   https://github.com/andreasvc/vim-256noir/

" Basically: dark background, numerals & errors red,
" rest different shades of gray.
"
" colors 232--250 are shades of gray, from dark to light;
" 16=black, 255=white, 196=red, 88=darkred.

highlight clear
set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name = "256_noir"

if has("gui_running") || &t_Co == 256
    hi Normal       gui=NONE            guifg=#bcbcbc   guibg=NONE
    hi Keyword      gui=NONE            guifg=#eeeeee   guibg=NONE
    hi Constant     gui=bold            guifg=#d0d0d0   guibg=NONE
    hi String       gui=NONE            guifg=#6060ff   guibg=NONE
    hi Comment      gui=NONE            guifg=#585858   guibg=NONE
    hi Number       gui=bold            guifg=#4040ff   guibg=NONE
    hi Boolean      gui=bold            guifg=#4040ff   guibg=NONE
    hi Error        gui=NONE            guifg=#eeeeee   guibg=#870087
    hi ErrorMsg     gui=NONE            guifg=#eeeeee   guibg=#0000af
    hi Search       gui=NONE            guifg=#8a8a8a   guibg=#303030
    hi IncSearch    gui=reverse         guifg=#eeeeee   guibg=#8a8a8a
    hi DiffChange   gui=NONE            guifg=#0000d7   guibg=#eeeeee
    hi DiffText     gui=bold            guifg=#bcbcbc   guibg=#2020ff
    hi SignColumn   gui=NONE            guifg=#0000af   guibg=#585858
    hi SpellBad     gui=undercurl       guifg=#eeeeee   guibg=#870087
    hi SpellCap     gui=NONE            guifg=#eeeeee   guibg=#0000af
    hi SpellRare    gui=NONE            guifg=#0000af   guibg=NONE
    hi SpecialKey   gui=bold            guifg=#eeeeee   guibg=#8080ff
    hi MatchParen   gui=bold            guifg=#afafff   guibg=#000050

    hi WildMenu     gui=NONE            guifg=#585858   guibg=#eeeeee
    hi Pmenu        gui=NONE            guifg=#eeeeff   guibg=#0101af
    hi PmenuThumb   gui=NONE            guifg=#080808   guibg=#585858

    hi CursorLine   gui=NONE            guifg=NONE      guibg=#121212
    hi StatusLine   gui=bold,reverse    guifg=#8a8a8a   guibg=NONE
    hi StatusLineNC gui=reverse         guifg=#303030   guibg=NONE
    hi Visual       gui=reverse         guifg=#bcbcff   guibg=NONE
    hi TermCursor   gui=reverse         guifg=NONE      guibg=NONE
    hi CursorLineNr gui=NONE            guifg=#1010ff   guibg=NONE
    hi LineNr       gui=NONE            guifg=#252525   guibg=NONE
    hi LineNr       gui=NONE            guifg=#606060   guibg=NONE

    "
    " NOTE My additions
    "

    hi Conceal gui=NONE guifg=#585858 guibg=NONE

    " Tab bar
    hi TabLine gui=NONE guifg=#808080 guibg=NONE
    hi TabLineSel gui=NONE guifg=#bcbcff guibg=NONE
    hi TabLineFill gui=NONE guifg=#000000 guibg=NONE

    " For diffing
    hi DiffAdd cterm=NONE ctermfg=Green ctermbg=NONE guifg=#00ff00 guibg=NONE
    hi DiffChange cterm=NONE ctermfg=11 ctermbg=NONE guifg=#ffaf00  guibg=NONE
    hi DiffDelete cterm=NONE ctermfg=Red ctermbg=NONE guifg=#ff0000 guibg=NONE
    hi DiffText cterm=NONE ctermfg=White ctermbg=NONE guibg=NONE

    " For git gutter
    hi clear SignColumn
    hi GitGutterAdd cterm=NONE ctermfg=Green ctermbg=NONE guifg=#00ff00 guibg=NONE
    hi GitGutterChange cterm=NONE ctermfg=11 ctermbg=NONE guifg=#ffaf00  guibg=NONE
    hi GitGutterDelete cterm=NONE ctermfg=Red ctermbg=NONE guifg=#ff0000 guibg=NONE
    hi GitGutterChangeDelete cterm=NONE ctermfg=11 ctermbg=NONE guifg=#ff2000  guibg=NONE

    " For neoclide/coc-highlight - highlight matching under cursor
    hi CocHighlightText gui=bold guifg=White guibg=NONE

    " Change highlighting of cursor line when entering/leaving Insert Mode
    autocmd InsertEnter * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=234 guifg=NONE guibg=NONE
    autocmd InsertLeave * highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212
    set termguicolors

    " Ruby specific
    "hi rubyRegexp gui=NONE guifg=White guibg=#0000ff
    hi! link rubyRegexp Number
    hi rubySymbol gui=NONE guifg=#afafff guibg=NONE

else
    hi Normal cterm=NONE ctermfg=Gray ctermbg=Black
    hi Keyword cterm=NONE ctermfg=White ctermbg=Black
    hi Constant cterm=NONE ctermfg=Gray ctermbg=Black
    hi String cterm=NONE ctermfg=Red ctermbg=Black
    hi Comment cterm=NONE ctermfg=DarkGray ctermbg=Black
    hi Number cterm=NONE ctermfg=Red ctermbg=Black
    hi Error cterm=NONE ctermfg=White ctermbg=DarkRed
    hi ErrorMsg cterm=NONE ctermfg=White ctermbg=Red
    hi Search cterm=NONE ctermfg=Gray ctermbg=DarkGray
    hi IncSearch cterm=reverse ctermfg=White ctermbg=Gray
    hi DiffChange cterm=NONE ctermfg=Red ctermbg=White
    hi DiffText cterm=bold ctermfg=Gray ctermbg=Red
    hi SignColumn cterm=NONE ctermfg=Red ctermbg=DarkGray
    hi SpellBad cterm=undercurl ctermfg=White ctermbg=DarkRed
    hi SpellCap cterm=NONE ctermfg=White ctermbg=Red
    hi SpellRare cterm=NONE ctermfg=Red ctermbg=Black
    hi WildMenu cterm=NONE ctermfg=DarkGray ctermbg=White
    hi Pmenu cterm=NONE ctermfg=White ctermbg=DarkGray
    hi PmenuThumb cterm=NONE ctermfg=Black ctermbg=DarkGray
    hi SpecialKey cterm=NONE ctermfg=Black ctermbg=White
    hi MatchParen cterm=NONE ctermfg=Black ctermbg=DarkGray
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=Black
    hi StatusLine cterm=bold,reverse ctermfg=Gray ctermbg=Black
    hi StatusLineNC cterm=reverse ctermfg=DarkGray ctermbg=Black
    hi Visual cterm=reverse ctermfg=Gray ctermbg=Black
    hi TermCursor cterm=reverse ctermfg=NONE ctermbg=NONE
endif
"highlight! link Boolean Normal
highlight! link Delimiter Normal
highlight! link Identifier Normal
highlight! link Title Normal
highlight! link Debug Normal
highlight! link Exception Normal
highlight! link FoldColumn Normal
highlight! link Macro Normal
highlight! link ModeMsg Normal
highlight! link MoreMsg Normal
highlight! link Question Normal
highlight! link Conditional Keyword
highlight! link Statement Keyword
highlight! link Operator Keyword
highlight! link Structure Keyword
highlight! link Function Keyword
highlight! link Include Keyword
highlight! link Type Keyword
highlight! link Typedef Keyword
highlight! link Todo Keyword
highlight! link Label Keyword
highlight! link Define Keyword
"highlight! link DiffAdd Keyword
"highlight! link diffAdded Keyword
"highlight! link diffCommon Keyword
highlight! link Directory Keyword
highlight! link PreCondit Keyword
highlight! link PreProc Keyword
highlight! link Repeat Keyword
highlight! link Special Keyword
highlight! link SpecialChar Keyword
highlight! link StorageClass Keyword
highlight! link SpecialComment String
highlight! link CursorLineNr String
highlight! link Character Number
highlight! link Float Number
highlight! link Tag Number
highlight! link Folded Number
highlight! link WarningMsg Number
highlight! link iCursor SpecialKey
highlight! link SpellLocal SpellCap
"highlight! link LineNr Comment
highlight! link NonText Comment
"highlight! link DiffDelete Comment
"highlight! link diffRemoved Comment
highlight! link PmenuSbar Visual
highlight! link PmenuSel Visual
highlight! link VisualNOS Visual
highlight! link VertSplit Visual
highlight! link Cursor StatusLine
highlight! link Underlined SpellRare
highlight! link rstEmphasis SpellRare
"highlight! link diffChanged DiffChange
