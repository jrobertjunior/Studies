
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To load plugins
execute pathogen#infect()

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and Feel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" to syntax color
syntax on

" Set the dark gruvbox color theme
let g:gruvbox_italic=1
colorscheme gruvbox
set t_Co=256
set background=dark
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn on the WiLd menu: 
" This is the cool menu to help to complete vim commands
set wildmenu
set wildmode=longest:full,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Makes search act like search in modern browsers
" It will search as I type the word
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Configure backspace so it acts as it should act
" I really don't see any diference, shold test better
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

""""""""""""""""""""""""""""""""""""""""""
"  Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
"
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""
" => Status line
""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l}
