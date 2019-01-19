" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2006 Apr 15

" This color scheme uses a light grey background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "morning"

hi Normal ctermfg=Yellow ctermbg=DarkBlue guifg=#FFE375 guibg=#001E42

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are different from the morning scheme
hi Cursor ctermbg=Brown ctermfg=NONE guibg=DarkOrange guifg=NONE
hi lCursor ctermbg=Brown ctermfg=NONE guibg=DarkOrange guifg=NONE
hi Visual term=reverse ctermbg=DarkRed guibg=#885511
hi VertSplit term=reverse cterm=reverse gui=reverse ctermfg=Gray ctermbg=Gray guifg=gray80 guibg=gray80
hi WildMenu term=standout ctermbg=Brown ctermfg=White guibg=DarkOrange guifg=White

if has("win32") || has("win64") 
    hi IncSearch term=reverse cterm=none gui=none ctermbg=Red ctermfg=White guibg=DarkOrange guifg=White
else
    hi IncSearch term=reverse cterm=none gui=none ctermbg=DarkRed ctermfg=White guibg=DarkOrange guifg=White
endif

hi CursorLine term=underline cterm=none ctermbg=DarkGray guibg=#003050
hi CursorColumn term=reverse cterm=none ctermbg=DarkGray guibg=#003050
hi NonText term=bold cterm=bold ctermbg=Black ctermfg=Gray gui=bold guifg=grey50 guibg=#000030
hi EndOfBuffer term=none cterm=none ctermbg=Black ctermfg=Black gui=bold guifg=grey50 guibg=#000030

if has("win32") || has("win64") 
    hi StatusLine term=reverse,bold cterm=bold gui=reverse,bold ctermbg=Gray ctermfg=DarkBlue guifg=gray80
    hi StatusLineNC term=reverse cterm=bold gui=reverse ctermbg=Gray ctermfg=DarkBlue guifg=gray80
else
    hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold ctermfg=Gray guifg=gray80
    hi StatusLineNC term=reverse cterm=reverse gui=reverse ctermfg=Gray guifg=gray80
endif

" Groups used in the 'highlight' and 'guicursor' options default value.
" These are same as the morning scheme
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi ModeMsg term=bold cterm=bold gui=bold
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Directory term=bold cterm=bold ctermfg=White guifg=White gui=bold
hi LineNr term=underline ctermfg=Brown guifg=DarkYellow
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=#885511 guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi Folded term=standout ctermbg=DarkGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan

" Colors for syntax highlighting
" ------------------------------

" Titles (in markdown, mostly) are red
hi Title term=bold ctermfg=Red gui=none guifg=Tomato

" Comments and Preprocessor stand out from source code:
hi Comment ctermfg=Green guifg=#66bb66
hi PreProc ctermfg=Magenta guifg=#B57FCA

" Special chars (ex '\n') are grouped by bright background
hi Special  term=bold ctermfg=DarkMagenta guibg=grey25

" Strings have a slight red tint (useful to tell if not delimited)
hi String      term=underline ctermfg=Brown guifg=#FFBA75
hi SpecialChar term=underline ctermfg=Brown guifg=#FFBA75 guibg=#102E52

" Type definitions (struct, typedef) stand out a little bit, slightly diff
" yellow
hi Structure ctermfg=White guifg=#FFD375 gui=none
hi Typedef ctermfg=White   guifg=#FFD375 gui=none

" Keywords are Yellow
hi Statement ctermfg=White guifg=#FFD375 gui=none
hi Function ctermfg=White guifg=#FFD375 gui=none

" TODO, etc are yellow
hi Todo ctermbg=Yellow ctermfg=Black guibg=Gold

" Errors are red
hi Error guifg=Red guibg=gray25

" Everything else looks the same, 
hi Constant term=underline ctermfg=Brown guifg=#FFBA75 
hi Type ctermfg=Yellow guifg=#FFE375 gui=none
hi Identifier guifg=#FFE375   
hi Ignore ctermfg=Red guifg=grey90

"
