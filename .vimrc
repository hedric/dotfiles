filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

set t_Co=256
colorscheme modest
syntax on
set bg=dark
""PhoenixGreen
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_termcolors='256'

inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
inoremap {{<CR> {<CR>}<ESC>O
inoremap {{;<CR> {<CR>};<ESC>O 


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

set cursorline

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

