" This scheme was created by CSApproxSnapshot
" on Sun, 04 Sep 2016

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || &t_Co == 256

    CSAHi Normal term=NONE cterm=NONE ctermbg=none ctermfg=249
    CSAHi Comment term=NONE cterm=NONE ctermbg=none ctermfg=242
    CSAHi Constant term=NONE cterm=NONE ctermbg=none ctermfg=244
    CSAHi Special term=NONE cterm=NONE ctermbg=none ctermfg=51

    CSAHi Braces term=NONE cterm=NONE ctermbg=none ctermfg=246
    CSAHi Type term=NONE cterm=NONE ctermbg=none ctermfg=249
    CSAHi String term=NONE cterm=NONE ctermbg=none ctermfg=30
    CSAHi Number term=NONE cterm=NONE ctermbg=none ctermfg=33
    CSAHi Boolean term=NONE cterm=NONE ctermbg=none ctermfg=14

    CSAHi IncSearch term=NONE cterm=NONE ctermbg=236 ctermfg=fg
    CSAHi Search term=NONE cterm=NONE ctermbg=235 ctermfg=fg

    CSAHi StatusLine term=NONE cterm=NONE ctermbg=244 ctermfg=232
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=none ctermfg=242

    CSAHi CursorLine term=NONE cterm=NONE ctermbg=233 ctermfg=fg

    CSAHi Underlined term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Ignore term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Error term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Todo term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=none ctermfg=10
    CSAHi DiffChange term=NONE cterm=NONE ctermbg=none ctermfg=11
    CSAHi DiffDelete term=NONE cterm=NONE ctermbg=none ctermfg=9
    CSAHi DiffText term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi pythonAttribute term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi pythonSpaceError term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimPythonRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi pythonSync term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi vimSubstPat term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiBang term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi SpecialKey term=NONE cterm=NONE ctermbg=none ctermfg=59
    CSAHi TermCursor term=reverse cterm=reverse ctermbg=none ctermfg=fg
    CSAHi TermCursorNC term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi NonText term=NONE cterm=NONE ctermbg=none ctermfg=59
    CSAHi Directory term=NONE cterm=NONE ctermbg=none ctermfg=245
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi vimPatRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimFunction term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiLink term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimCollClass term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimOperParen term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSynRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSynPatMod term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimExecute term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Cursor term=reverse cterm=reverse ctermbg=none ctermfg=fg
    CSAHi VisualNOS term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi lCursor term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi GitGutterAddDefault term=NONE cterm=NONE ctermbg=none ctermfg=28
    CSAHi GitGutterChangeDefault term=NONE cterm=NONE ctermbg=none ctermfg=142
    CSAHi GitGutterDeleteDefault term=NONE cterm=NONE ctermbg=none ctermfg=196
    CSAHi SpellBad term=undercurl cterm=undercurl ctermbg=none ctermfg=fg
    CSAHi SpellCap term=undercurl cterm=undercurl ctermbg=none ctermfg=fg
    CSAHi SpellRare term=undercurl cterm=undercurl ctermbg=none ctermfg=fg
    CSAHi SpellLocal term=undercurl cterm=undercurl ctermbg=none ctermfg=fg

    CSAHi vimAutoCmdSpace term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimEcho term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimGlobal term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiFontname term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiGuiFontname term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimIsCommand term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimExtCmd term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimNormCmds term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi PreProc term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi Pmenu term=NONE cterm=NONE ctermbg=234 ctermfg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=236 ctermfg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=235 ctermfg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=238 ctermfg=fg

    CSAHi TabLine term=NONE cterm=NONE ctermbg=none ctermfg=242
    CSAHi TabLineSel term=NONE cterm=NONE ctermbg=none ctermfg=246
    CSAHi vimMenuMap term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiTermcap term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAutoCmdSfxList term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimCommentTitleLeader term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiCtermColor term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSyncLines term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimIf term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMenuPriority term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimFilter term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimFuncBlank term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSet term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimCollection term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimUserCmd term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimCmdSep term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMenuRhs term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimHiKeyList term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimClusterName term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Conditional term=NONE cterm=NONE ctermbg=none ctermfg=245
    CSAHi vimSynKeyRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi MoreMsg term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi ModeMsg term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi LineNr term=NONE cterm=NONE ctermbg=none ctermfg=237
    CSAHi CursorLineNr term=NONE cterm=NONE ctermbg=none ctermfg=242
    CSAHi Question term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi VertSplit term=NONE cterm=NONE ctermbg=none ctermfg=236
    CSAHi Title term=NONE cterm=NONE ctermbg=none ctermfg=244
    CSAHi Visual term=NONE cterm=NONE ctermbg=232 ctermfg=fg
    CSAHi vimSynMtchCchar term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAugroupSyncA term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSyncMatch term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimGroupList term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMapLhs term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMapRhs term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSynLine term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSubstRep4 term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAugroupError term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi GitGutterDeleteInvisible term=NONE cterm=NONE ctermbg=none ctermfg=232
    CSAHi vimStdPlugin term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi GitGutterChangeInvisble term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMapRhsExtend term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimMenuBang term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimFuncBody term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi TabLineFill term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi CursorColumn term=NONE cterm=NONE ctermbg=none ctermfg=fg

    CSAHi ColorColumn term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi MatchParen term=NONE cterm=NONE ctermbg=none ctermfg=255
    CSAHi Identifier term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Statement term=bold cterm=bold ctermbg=none ctermfg=250
    CSAHi vimSyncLinebreak term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSyncLinecont term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSyncRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimEscapeBrace term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSetEqual term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSubstRep term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSubstRange term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimUserAttrbError term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAutoEventList term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimFiletype term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAugroup term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi GitGutterAddInvisible term=NONE cterm=NONE ctermbg=none ctermfg=232
    CSAHi vimSynMatchRegion term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimAuSyntax term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi vimSynMtchGroup term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi StorageClass term=NONE cterm=NONE ctermbg=none ctermfg=247
    CSAHi GitGutterChangeInvisible term=NONE cterm=NONE ctermbg=none ctermfg=232
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=none ctermfg=fg
    CSAHi Folded term=NONE cterm=NONE ctermbg=none ctermfg=242
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=none ctermfg=59
    CSAHi Conceal term=NONE cterm=NONE ctermbg=none ctermfg=244
endif

if 1
    delcommand CSAHi
endif
