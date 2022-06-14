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
    " Probably not nessa for 256 colos
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm

    hi Normal cterm=NONE ctermfg=250 ctermbg=NONE gui=NONE
    hi Keyword cterm=NONE ctermfg=255 ctermbg=NONE gui=NONE
    hi Constant cterm=NONE ctermfg=252 ctermbg=NONE gui=NONE
    hi String cterm=NONE ctermfg=203 ctermbg=NONE gui=NONE
    hi Comment cterm=NONE ctermfg=240 ctermbg=NONE gui=NONE
    hi Number cterm=NONE ctermfg=196 ctermbg=NONE gui=NONE
    hi Error cterm=NONE ctermfg=255 ctermbg=88 gui=NONE
    hi ErrorMsg cterm=NONE ctermfg=255 ctermbg=124 gui=NONE
    hi Search cterm=NONE ctermfg=236 ctermbg=245 gui=NONE
    hi IncSearch cterm=reverse ctermfg=255 ctermbg=245 gui=reverse
    hi SignColumn cterm=NONE ctermfg=124 ctermbg=NONE gui=NONE
    hi SpellBad cterm=undercurl ctermfg=255 ctermbg=88 gui=undercurl
    hi SpellCap cterm=NONE ctermfg=255 ctermbg=124 gui=NONE
    hi SpellRare cterm=NONE ctermfg=124 ctermbg=16 gui=NONE
    hi WildMenu cterm=NONE ctermfg=240 ctermbg=255 gui=NONE
    hi Pmenu cterm=NONE ctermfg=255 ctermbg=240 gui=NONE
    hi PmenuThumb cterm=NONE ctermfg=232 ctermbg=240 gui=NONE
    hi SpecialKey cterm=NONE ctermfg=16 ctermbg=255 gui=NONE
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE
    hi StatusLine cterm=bold,reverse ctermfg=245 ctermbg=16 gui=bold,reverse
    hi StatusLineNC cterm=reverse ctermfg=236 ctermbg=16 gui=reverse
    hi Visual cterm=reverse ctermfg=250 ctermbg=16 gui=reverse
    hi TermCursor cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE

    " For git gutter
    hi DiffAdd cterm=NONE ctermfg=Green ctermbg=NONE
    hi DiffChange cterm=NONE ctermfg=11 ctermbg=NONE
    hi DiffDelete cterm=NONE ctermfg=Red ctermbg=NONE
    hi DiffText cterm=NONE ctermfg=fg ctermbg=NONE

    " Gee, I wonder
    hi MatchParen cterm=bold ctermfg=White ctermbg=NONE gui=NONE

    " I actually can't remember ..
    hi CocHighlightText term=bold cterm=bold ctermbg=NONE ctermfg=white

    " Ruby specific
    hi rubyRegexp cterm=NONE ctermfg=196 ctermbg=NONE gui=NONE
else

endif

highlight! link Boolean Keyword
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
highlight! link LineNr Comment
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
highlight! link rubySymbol Constant
