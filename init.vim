" Neovim config 
"set nocompatible

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-rooter'
Plug 'tomasiser/vim-code-dark'
Plug 'arcticicestudio/nord-vim'
Plug 'yggdroot/indentline'
call plug#end()

syntax on
filetype plugin indent on

" show existing tab with 2 spaces width
set tabstop     =2
set softtabstop =2
set shiftwidth  =2
set expandtab

" Give more space for displaying messages
set cmdheight=2

" Lower the update time (default = 4000ms )
set updatetime=50
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

let mapleader=" "
nnoremap <Space> <Nop>

" Source configs
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim

"" Gruvbox theme-settings below
set t_Co=256
set t_ut=
let g:gruvbox_termcolors='256'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection = 0

colorscheme gruvbox
set background=dark
set termguicolors

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks =
			\  [ 'indent', 'trailing', 'mixed-indent-file', 'conflicts' ]

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']

" Disable tabline close button
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1


let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#coc#enabled = 1

" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
" let g:airline_skip_empty_sections = 1

let g:airline_section_c = airline#section#create([''])
let g:airline_section_z = airline#section#create(['linenr'])

let g:indentline_char_list = ['|', '|', '|', '|']

" Switch to your current theme
" let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Set cursorline
set cursorline

" Sections
let g:airline_section_c = ''
let g:airline_section_a = ""
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

" Mappings
"inoremap "" ""<left>
"inoremap '' ''<left>
"inoremap (( ()<left>
"inoremap [[ []<left>
"inoremap {{ {}<left>
"inoremap {{<CR> {<CR>}<ESC>O
"inoremap {{;<CR> {<CR>};<ESC>O
map <C-f> :Files<CR>

" GoTo code navigation
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gr <Plug>(coc-references)

" Buffer movement bindings
nmap gn :bn<CR>
nmap gN :bp<CR>
nmap gd :bd<CR>

set wildmenu
set mouse=a
set rnu
set nowrap
set number
set nohlsearch

" Disable highlight match parenthesis etc.
let loaded_matchparen = 1
set laststatus=2

" Incremental search. start searching and moving through the file while typing
" the search phrase
set incsearch
set smartcase
set autoindent
set smartindent

set signcolumn=no

" Disable ex-mode
nnoremap Q <Nop>
nnoremap J j
nnoremap K k

" Ctags
set autochdir
set tags=tags;/

" Some conflict coloring
function! ConflictsHighlight() abort
	syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
	syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
	syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

	highlight conflictStart ctermbg=red ctermfg=black
	highlight conflictMiddle ctermbg=blue ctermfg=black
	highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction

augroup MyColors
	autocmd!
	autocmd BufEnter * call ConflictsHighlight()
augroup END

