""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" My custom .vimrc file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Keys Mapping
"
" F1  - Vim Help - (default)       |
" F2  - Save Document              | Ctrl-F2  - Force save 
" F3  - Close Vim                  | Ctrl-F3  - Force close (lost changes)
" F4  - Close Buffer               | Ctrl-F4  - Force close buffer (lost changes)
" F5  - Toggle highlight search    |
" F6  - List Open Buffers          |
" F7  - Toggle English Speelcheck  |
" F8  - Open/Close Tag Bar         |
" F9  -
" F10 -
" F11 -
" F12 - 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps:
"   Ctrl + u --> Opens undotree plugin window
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()
syntax on
filetype plugin indent on

set path=$PWD/**

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile

" Open Undo Tree (PlugIn)
nnoremap  <C-u> :UndotreeToggle<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto and Samrt indent
set ai 
set si 

" Tabs are evil, lets use spaces (four is good)
set tabstop=4
set shiftwidth=4
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and Fell :)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force the use of 256 colors
set t_Co=256

" Put the enconding to utf-8
set encoding=utf-8

" Set itallic for the gruvbox color scheme
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark    " Setting dark mode"

"adds the cursorline highlight
set cul                                           



"" Show the line and column number of the cursor position
set ruler

"" Ignore case when searching
set ignorecase

"" When searching, try to be smart about cases
set smartcase

set incsearch

highlight LineNr ctermbg=234

"" Print the line number in front of each line
set number

set hidden

if version >= 700
   set spl=en spell
   set nospell "do not start the vim with spelling check"
endif

:let mapleader = ","

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'"

" AirLine color
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts=1


" command-line completion operates in an enhanced mode
set wildmenu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"" Move to the next buffer
nmap <M-Right> :bnext<CR>

"" Move to the previous buffer
nmap <M-Left> :bprevious<CR>"


nnoremap j gj
nnoremap k gk
 
"" Paste on  visual mode as ctrl-v
vnoremap p "_dP
"
" Configure backspace so it acts as it should act                                                 
" I really don't see any diference, shold test better
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

"Cool trick to use the recording (switchs the record and the insert with the
"capslock key :) and using the key q
:noremap Q @q

""""""""""""""
" Visual mode related
"""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
 
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""" 
" Status line 
""""""""""""""" 
" Always show the status line 
set laststatus=2 
 
" Format the status line 
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l} 


""""""""""""""""""""""""""""""""""""""""
"" Search
""""""""""""""""""""""""""""""""""""""""

"" To find a file in the subdirectories
map <C-f> :CtrlP<CR>

"" Toggle highlight search on/off. Press * over a word to search it
noremap <F5> :set hlsearch! hlsearch?<CR>

"" Open the file tree explorer
map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""
" Window manipulation
"""""""""""""""""""""""""""""""""""""""

" Change the current open buffer window
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

"""""""""""""""""""""""""""""""""""""
" File editor helper
""""""""""""""""""""""""""""""""""""""
map <M-Up> :m -2<CR>==
map <M-Down> :m +1<CR>==



"""""""""""""""""""""""""""""""""""""
"" Tags and project navigation
""""""""""""""""""""""""""""""""""""

" Open file tags list
nmap <F8> :TagbarToggle<CR>

" List all calls or callers to the selected word
nnoremap <C-\> :call CscopeFindInteractive(expand('<cword>'))<CR>

nnoremap <leader>j :vertical-resize 10<CR>==
nnoremap <leader>l :call ToggleLocationList()<CR>

""""""""""""""""""""""""""""""""""""
"" Buffer manipulation
""""""""""""""""""""""""""""""""""""
nnoremap <F6> :buffers<CR>:buffer<Space>

" copy all to clipboard
map<C-a> :%y+<CR>

"" Save with F2
"nnoremap <F2> :w<CR>zz
"inoremap <F2> <Esc><F2>i

"nnoremap <leader><F2> :w!<CR>zz

"" Close a buffer with F3
nnoremap <F3> :Bdelete<CR>
inoremap <F3> <Esc><F3>i

nnoremap <leader><F3> :Bdelete!<CR>

"Close vim with F4

nnoremap <F4> :q<CR>
nnoremap <leader><F4> :q!<CR>

nn <F7> :setlocal spell! spell?<CR>

map<C-h> :Ack 

