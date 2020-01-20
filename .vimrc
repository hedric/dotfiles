syntax on
set background=dark
colorscheme jellybeans
set number

set t_Co=256

set mouse=a

" Customize status line
set statusline=%f%m%r%h%w\ 
set statusline+=[%{&ff}]
set statusline+=%=
set statusline+=[\%03.3b/\%02.2B]\ [POS=%04v]

" Disable mode line
set nomodeline

" Enable cursor line
set cursorline

" Enable wildmenu
set wildmenu

" Tab length indentation stuff
filetype plugin indent on
set tabstop=4

set shiftwidth=4
set expandtab

