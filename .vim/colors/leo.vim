" Lorenzo Leonini <vim-theme[a]leonini[.]net>
" Modified by Yvon Cognard <yvon[a]cognard[.]com>

let g:colors_name = "leo256"
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

hi   Normal         cterm=none             ctermfg=255    ctermbg=16
hi   CursorLine     cterm=none             ctermbg=232
hi   SpecialKey     cterm=none             ctermfg=245    ctermbg=233
hi   Folded         cterm=none             ctermfg=110    ctermbg=233
hi   Cursor         cterm=none             ctermfg=bg     ctermbg=fg
hi   DiffAdd        cterm=none             ctermbg=235
hi   DiffChange     cterm=none             ctermbg=235
hi   DiffDelete     cterm=none             ctermfg=238    ctermbg=244
hi   DiffText       cterm=bold             ctermfg=255    ctermbg=196
hi   Directory      cterm=none             ctermfg=196
hi   ErrorMsg       cterm=none             ctermfg=255    ctermbg=160
hi   FoldColumn     cterm=none             ctermfg=110    ctermbg=16
hi   IncSearch      cterm=reverse
hi   LineNr         cterm=none             ctermfg=239    ctermbg=16
hi   ModeMsg        cterm=bold
hi   MoreMsg        cterm=none             ctermfg=40
hi   NonText        cterm=none             ctermfg=21
hi   Question       cterm=none             ctermfg=40
hi   Search         cterm=none             ctermfg=16     ctermbg=248
hi   SignColumn     cterm=none             ctermbg=16
hi   StatusLine     cterm=bold             ctermfg=232    ctermbg=255
hi   StatusLineNC   cterm=none             ctermfg=252    ctermbg=17
hi   Title          cterm=none             ctermfg=33
hi   VertSplit      cterm=none             ctermfg=254    ctermbg=16
hi   Visual         cterm=reverse          ctermbg=none
hi   VisualNOS      cterm=underline,bold
hi   WarningMsg     cterm=none             ctermfg=255
hi   WildMenu       cterm=none             ctermfg=16     ctermbg=11
hi   MatchParen     cterm=none             ctermfg=190    ctermbg=20
hi   Pmenu          cterm=none             ctermfg=255    ctermbg=235
hi   PmenuSel       cterm=none             ctermfg=255    ctermbg=21
hi   PmenuSbar      cterm=none             ctermfg=240    ctermbg=240
hi   PmenuThumb     cterm=none             ctermfg=255    ctermbg=255
hi   SpellBad       cterm=none             ctermfg=16     ctermbg=196
hi   SpellCap       cterm=none             ctermfg=16     ctermbg=196
hi   SpellLocal     cterm=none             ctermfg=16     ctermbg=196
hi   SpellRare      cterm=none             ctermfg=16     ctermbg=196
hi   TabLine        cterm=none             ctermfg=233    ctermbg=110
hi   TabLineSel     cterm=none             ctermfg=110    ctermbg=233
hi   TabLineFill    cterm=none             ctermfg=233    ctermbg=110
hi   ColorColumn    cterm=none             ctermbg=232

" SYNTAX HIGHLIGHTING
hi   Boolean       cterm=none        ctermfg=215
hi   Character     cterm=none        ctermfg=184
hi   Comment       cterm=none        ctermfg=248
hi   Conditional   cterm=none        ctermfg=33
hi   Constant      cterm=none        ctermfg=226
hi   Define        cterm=bold        ctermfg=27
hi   Delimiter     cterm=none        ctermfg=196
hi   Error         cterm=none        ctermfg=255    ctermbg=9
hi   Exception     cterm=bold        ctermfg=226
hi   Function      cterm=none        ctermfg=196
hi   Identifier    cterm=none        ctermfg=40
hi   Keyword       cterm=none        ctermfg=123
hi   Number        cterm=none        ctermfg=209
hi   Operator      cterm=none        ctermfg=226
hi   PreProc       cterm=none        ctermfg=202
hi   Special       cterm=none        ctermfg=206    ctermbg=234
hi   Statement     cterm=none        ctermfg=171
hi   String        cterm=none        ctermfg=180    ctermbg=234
hi   cterm=none    ctermfg=226       ctermbg=none
hi   Type          cterm=none        ctermfg=75
hi   Underlined    cterm=underline   ctermfg=39

" ADDITIONNAL
hi   Repeat            cterm=none   ctermfg=99
hi   ExtraWhitespace   ctermbg=88
match ExtraWhitespace /\s\+\%#\@<!$/
