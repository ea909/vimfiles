" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 15

" This color scheme uses a light grey background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "morning"

hi Normal ctermfg=White ctermbg=Black guifg=White guibg=gray20

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are different from the morning scheme
hi Cursor guibg=DarkOrange guifg=NONE
hi lCursor guibg=DarkOrange guifg=NONE
hi Visual term=reverse ctermbg=grey guibg=#885511
hi VertSplit term=reverse cterm=reverse gui=reverse guifg=gray80 guibg=gray80
hi WildMenu term=standout ctermbg=Yellow ctermfg=White guibg=DarkOrange guifg=White
hi IncSearch term=reverse cterm=reverse gui=none guibg=DarkOrange guifg=White
hi CursorLine term=underline cterm=underline guibg=grey30
hi CursorColumn term=reverse ctermbg=grey guibg=grey30
hi NonText term=bold ctermfg=Blue gui=bold guifg=grey50 guibg=grey15
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold guifg=gray80
hi StatusLineNC term=reverse cterm=reverse gui=reverse guifg=gray80

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are same as the morning scheme
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi ModeMsg term=bold cterm=bold gui=bold
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Directory term=bold cterm=bold guifg=White gui=bold
hi LineNr term=underline ctermfg=Brown guifg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan

" Colors for syntax highlighting
" ------------------------------

" Titles (in markdown, mostly) are red
hi Title term=bold ctermfg=DarkMagenta gui=none guifg=Tomato

" Comments and Preprocessor stand out from source code:
hi Comment guifg=DeepSkyBlue
hi PreProc guifg=LightMagenta

" Special chars (ex '\n') are grouped by bright background
hi Special  term=bold ctermfg=DarkMagenta guifg=White guibg=grey25

" Strings have a slight red tint (useful to tell if not delimited)
hi String      term=underline ctermfg=White guifg=#FFDDDD 
hi SpecialChar term=underline ctermfg=White guifg=#FFDDDD guibg=grey25

" Type definitions (struct, typedef) stand out a little bit, green
hi Structure ctermfg=White guifg=#DDFFDD gui=none
hi Typedef ctermfg=White guifg=#DDFFDD gui=none

" Keywords are slightly blue
hi Statement ctermfg=White guifg=#DDDDFF gui=none

" TODO, etc are yellow
hi Todo guibg=Gold

" Errors are red
hi Error guifg=Red guibg=gray25

" Everything else looks the same, White
hi Constant term=underline ctermfg=White guifg=White 
hi Type ctermfg=White guifg=White gui=none
hi Type ctermfg=White guifg=White gui=none
hi Identifier guifg=White   
hi Ignore ctermfg=Red guifg=grey90

"
