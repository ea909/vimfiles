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

hi Normal ctermfg=Black ctermbg=LightGrey guifg=Black guibg=gray90 

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are different from the morning scheme
hi Cursor guibg=Orange guifg=NONE
hi lCursor guibg=Orange guifg=NONE
hi Visual term=reverse ctermbg=grey guibg=#FFCC55
hi VertSplit term=reverse cterm=reverse gui=reverse guifg=Black guibg=Black
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Orange guifg=Black
hi IncSearch term=reverse cterm=reverse gui=none guibg=Orange guifg=White

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are same as the morning scheme
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Directory term=bold cterm=bold guifg=Black gui=bold
hi LineNr term=underline ctermfg=Brown guifg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=Blue gui=bold guifg=Black guibg=grey80
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi CursorLine term=underline cterm=underline guibg=grey80
hi CursorColumn term=reverse ctermbg=grey guibg=grey80

" Colors for syntax highlighting
" ------------------------------

" Titles (in markdown, mostly) are red
hi Title term=bold ctermfg=DarkMagenta gui=none guifg=Red

" Comments and Preprocessor stand out from source code:
hi Comment guifg=Blue
hi PreProc guifg=Purple

" Special chars (ex '\n') are grouped by bright background
hi Special  term=bold ctermfg=DarkMagenta guifg=Black guibg=grey95

" Strings have a slight red tint (useful to tell if not delimited)
hi String      term=underline ctermfg=Black guifg=#660000 
hi SpecialChar term=underline ctermfg=Black guifg=#660000 guibg=grey95

" Type definitions (struct, typedef) stand out a little bit, green
hi Structure ctermfg=Black guifg=#006600 gui=none
hi Typedef ctermfg=Black guifg=#006600 gui=none

" Keywords are slightly blue
hi Statement ctermfg=Black guifg=#000066 gui=none

" TODO, etc are yellow
hi Todo guibg=Yellow

" Errors are red
hi Error guifg=Red guibg=gray95

" Everything else looks the same, Black
hi Constant term=underline ctermfg=Black guifg=Black 
hi Type ctermfg=Black guifg=Black gui=none
hi Type ctermfg=Black guifg=Black gui=none
hi Identifier guifg=Black   
hi Ignore ctermfg=Red guifg=grey90

"
