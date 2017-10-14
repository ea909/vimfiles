" Eric Alzheimer's
" vimrc

""""""""""""""""""""""""""""""""""""""""""
" Plugin management
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/vimfiles/plugged')
Plug 'vim-scripts/a.vim'
Plug 'justmao945/vim-clang'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
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
set cursorline
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
set gfn=Droid_Sans_Mono:h10:cANSI
" Terminal has a dark background
set background=dark
" 80 columns ( uncomment if used in terminal )
set columns=80
" 50 lines
set lines=50
" Get rid of menu, etc
set guioptions=
" Set folding method to use markers
set foldmethod=marker
" When typing txt or comments, wrap at 78 chars
set textwidth=78
" 50 lines of cmd hist
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
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

""""""""""""""""""""""""""""""""""""""""
" Syntax and filetype
""""""""""""""""""""""""""""""""""""""""

" Turn on syntax and good color scheme
syntax on
let c_comment_strings=1
colorscheme desert

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
" and one for python
au BufRead,BufNewFile *.py set tags+=~/.pytags
" and one for Ruby
au BufRead,BufNewFile *.rb set tags+=~/.rbtags
" and one for Java
au BufRead,BufNewFile *.java set tags+=~/.jtags

" Search in obvious places for project include files
set path+=./../inc,./../include

" Don't indent namespaces
set cino+=(0

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

" map leader+t to various tab
map <leader>te :tabedit<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t] :tabnext<cr>
map <leader>t[ :tabprev<cr>

" run build
map <leader>b :make<cr>

" Show and hide menu bar
map <leader>me :set guioptions=m<cr>
map <leader>md :set guioptions=<cr>

" Enter virtual edit mode, for tables and ascii art
map <leader>ve :set virtualedit=all<cr>
map <leader>vd :set virtualedit=<cr>

" Autcomplete mappings
imap <C-Space> <C-x><C-o> 
imap <C-Tab> <C-x><C-]>

" Alternative to ESC
inoremap kj <ESC>

" a.vim mappings
map <leader>aa :A<cr>
map <leader>as :AS<cr>
map <leader>av :AV<cr>

" Preview tag under cursor
map <leader>, <C-W>g}
map <leader>. :pclose<cr>
map <leader>j g<C-]>

" cd to dir of current file.
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Fix navigation in K&R style
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" External tools
""""""""""""""""""""""""""""""""""""""""""""""""""

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F11> :%!clang-format --style=WebKit
" TODO: make a style file for clang-format

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
" Options for vim-clang
""""""""""""""""""""""""""""""""""""""""""

" Auto popup is annoying
let g:clang_auto = 0

set completeopt=menu,preview

