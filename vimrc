" Eric Alzheimer's
" vimrc

""""""""""""""""""""""""""""""""""""""""""
" Plugin management
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/vimfiles/plugged')
Plug 'vim-scripts/a.vim'
Plug 'tikhomirov/vim-glsl'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'xolox/vim-misc'
"Plug 'Valloric/YouCompleteMe' 
call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" First, basic settings for the editor
""""""""""""""""""""""""""""""""""""""""""
" Exit vi compatibility mode
set nocompatible
" DO NOT automatically set working dir to dir of current file
" Doing that makes it hard to work in a project with 
" subdirectories.
set noautochdir
" Allow bksp over everything
set backspace=indent,eol,start
" Make backup files
set backup
" Always use mouse
set mouse=a
" highlight line cursor is on
if has("gui_running")
    set cursorline
endif
" perform incremental search
set incsearch
" no spacing between lines
set linespace=0
" Dont highlight search matches, its annoying
set nohlsearch
" Intelligently detect case sensitive searches
set smartcase
" Show Modeline at bottom
set ruler
" 4 spaces per tab
set tabstop=4
" Tab moves 4 spaces
set shiftwidth=4
" Uses spaces for tabs
set expandtab
" Use 4 spaces in soft tab
set softtabstop=4
" Set font
if has("win32") || has("win64")
    set gfn=Droid_Sans_Mono:h12
else
    set gfn=DejaVu\ Sans\ Mono\ 12
endif

" Terminal has a dark background
" Colorscheme will overwrite below if needed
set background=dark

if has("gui_running")
    " 80 columns ( unless  if used in terminal )
    set columns=80
    " 50 lines
    set lines=50
endif

" Get rid of menu, etc
set guioptions=
" Set folding method to use markers
set foldmethod=marker
" When typing txt or comments, wrap at 78 chars
set textwidth=78
" 200 lines of cmd hist
set history=200
" display imcomplete commands
set showcmd
" Set backup directory
set backupdir=~/tmp
" Set temp directory for unlimited persistent undo
set undofile
set undodir=~/tmp
" Use new completion line in vim 8
set wildmenu
" key code timeout, 100 ms
set ttimeout
set ttimeoutlen=100
" Show @@@ in the last line if it is truncated.
set display=truncate
" Keep 5 lines above and below cursor
set scrolloff=5
" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" no lang map
set nolangremap
" Shorter messages
set shortmess=afilnxtToO
" Always use visual mode, more flexible (behave like xterm)
set selectmode=
" Use xterm style mousing
set mousemodel=extend
" Use windows style keymodel
set keymodel=startsel,stopsel
" Use xterm style selection
set selection=inclusive
" Prefer utf8
set encoding=utf-8
" Default splits are wierd
set splitbelow
set splitright
" No tab line please
set showtabline=0
set tabpagemax=8

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" CDC = Change to Directory of Current file
command! CDC cd %:p:h

""""""""""""""""""""""""""""""""""""""""
" CUA style copy and paste for system
" clipboard
""""""""""""""""""""""""""""""""""""""""
if has("clipboard")
    vnoremap <C-X> "+x
    vnoremap <C-C> "+y

    map <C-V>		"+gP
    imap <C-V>		<C-O>"+gp
    cmap <C-V>		<C-R>+
endif

" Saves files, only usable out of terminal
noremap  <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

""""""""""""""""""""""""""""""""""""""""
" Syntax and filetype
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax and good color scheme
syntax on
let c_comment_strings=0

let startup_hour=str2nr(strftime("%H"))
if startup_hour < 18 && startup_hour > 4
    colorscheme myblue
else
    colorscheme myblue
endif

colorscheme myblue

" enable auto indent based on filetype
filetype on
filetype plugin indent on

" Set tabs to 2 spaces when working with ruby
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 

augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag file configurations....
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Default to any tags file in the current dir, or one above
set tags=./tags,./../tags
" Keep a good tags file for c libs, winapi, etc in home dir
au BufRead,BufNewFile *.py   set tags+=~/.pytags
au BufRead,BufNewFile *.rb   set tags+=~/.rbtags
au BufRead,BufNewFile *.java set tags+=~/.jtags
au BufRead,BufNewFile *.c    set tags+=~/.tags
au BufRead,BufNewFile *.cpp  set tags+=~/.tags

" Search in obvious places for project include files
set path+=./../inc,./../include

" Don't indent namespaces
set cino+=(0
set cinoptions+=:0
let c_no_curly_error = 1
let c_no_bracket_error = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Now, add new key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map direction keys + ctl to easy window switching
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Set , as leader
let mapleader=","
let maplocalleader=","

" I never use these, actually
" map leader+t to various tab
"map <leader>te :tabedit<cr>
"map <leader>tn :tabnew<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove<cr>
"map <leader>t] :tabnext<cr>
"map <leader>t[ :tabprev<cr>
map <leader>tn :tabnew<cr>
map <leader>te :set showtabline=1<cr>
map <leader>td :set showtabline=0<cr>

" run build
map <leader>b :make<cr><cr>:vertical botright cw<cr>

" Show and hide menu bar
map <leader>me :set guioptions=m<cr>
map <leader>md :set guioptions=<cr>

" Enter virtual edit mode, for tables and ascii art
map <leader>ve :set virtualedit=all<cr>
map <leader>vd :set virtualedit=<cr>

" Autcomplete mappings
imap <C-Space> <C-x><C-o> 
imap <Nul>     <C-x><C-o> 
imap <C-Tab>   <C-x><C-o>

" Alternative to ESC
inoremap kj <ESC>
tnoremap kj <C-\><C-n>

" a.vim mappings, switch to and split to
map <leader>a :A<cr>
map <leader>s :AV<cr>
map <leader>d :only<cr>
"map <leader>as :AS<cr>

" Tag based completion and nav
map <leader>, <C-W>}
map <leader>j g<C-]>
map <leader>k <C-T>
map <leader>. :pclose<cr>

" Fix navigation in K&R style
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""

" Create c/c++/java/c#/javascript comment block header
iabbrev #b /************************************************************
iabbrev #e <Space>***********************************************************/

" Comment block for python or ruby
au BufRead,BufNewFile *.rb,*.py iabbrev #b ############################################################
au BufRead,BufNewFile *.rb,*.py iabbrev #e ############################################################

let counter = 0

func! GetCounter()
  let g:counter += 1
  return g:counter . ''
endfunc

func! ResetCounter()
  let g:counter = 0
  return ''
endfunc

""""""""""""""""""""""""""""""""""""""""""
" Completion settings
""""""""""""""""""""""""""""""""""""""""""

set completeopt=menuone,preview

""""""""""""""""""""""""""""""""""""""""""
" F keys
""""""""""""""""""""""""""""""""""""""""""

" F1-F8 are tabs. I really don't understand why most editors don't map tabs to
" f-keys. F-keys are seldom bound to any
map <F1> :tabnext 1<cr>
map <F2> :tabnext 2<cr>
map <F3> :tabnext 3<cr>
map <F4> :tabnext 4<cr>
map <F5> :tabnext 5<cr>
map <F6> :tabnext 6<cr>
map <F7> :tabnext 7<cr>
map <F8> :tabnext 8<cr>

tnoremap <F1> <C-\><C-n>:tabnext 1<cr>
tnoremap <F2> <C-\><C-n>:tabnext 2<cr>
tnoremap <F3> <C-\><C-n>:tabnext 3<cr>
tnoremap <F4> <C-\><C-n>:tabnext 4<cr>
tnoremap <F5> <C-\><C-n>:tabnext 5<cr>
tnoremap <F6> <C-\><C-n>:tabnext 6<cr>
tnoremap <F7> <C-\><C-n>:tabnext 7<cr>
tnoremap <F8> <C-\><C-n>:tabnext 8<cr>

"F9-F12 are build, run, debug, save session
map <F9>    :make<cr><cr>:vertical botright cw<cr>

if has("win32")
    set makeprg=build.bat
    map <F10>   :silent exec "!run.bat"<cr>
    map <S-F10> :slient exec "!debug.bat"<cr>
    map <F12>   :silent exec "!gen_tags.bat"<cr>
else
    set makeprg=build.sh
    map <F10>   :silent exec "!run.sh"<cr>
    map <S-F10> :slient exec "!debug.sh"<cr>
    map <F12>   :silent exec "!gen_tags.sh"<cr>
endif

" Not used enough to take a button...
" map <F11>   :mksession session.vim<cr>
" map <S-F11> :source    session.vim<cr>

""""""""""""""""""""""""""""""""""""""""""
" title string
""""""""""""""""""""""""""""""""""""""""""
set titlestring=
set titlestring+=tab:
set titlestring+=\ %{tabpagenr()}
set titlestring+=\ file:
set titlestring+=\ 
set titlestring+=%f
set titlestring+=\ 
set titlestring+=%m

