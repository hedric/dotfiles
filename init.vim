syntax on

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces set expandtab

" Give more space for displaying messages.
set cmdheight=2

" Lower the update time (default = 4000ms ).
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

set t_Co=256

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors='256'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection = 0

colorscheme gruvbox

set bg=dark

" Mappings
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
inoremap {{<CR> {<CR>}<ESC>O
inoremap {{;<CR> {<CR>};<ESC>O 
map <C-f> :Files<CR>

set wildmenu
set mouse=a
set rnu
set nowrap
set number

" Customize our status line
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\ [\%03.3b/0x\%02.2B]         " line + column
""set statusline+=[\%03.3b/0x\%02.2B]\ [POS=%04v]
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

set laststatus=2

""set hlsearch
""nnoremap <CR> :noh<CR><CR>

"set cursorline

" Incremental search. start searching and moving through the file while typing
" the search phrase
set incsearch

set smartcase

set autoindent
set smartindent
"set cindent

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

