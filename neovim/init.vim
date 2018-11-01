" Neovim configuration

let mapleader = "\<Space>"
" =============================================================================
" # PLUGINS
" =============================================================================
set nocompatible
filetype off

call plug#begin()

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'shaunsingh/nord.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'drsooch/gruber-darker-vim'
Plug 'RRethy/nvim-base16'

" Conqueror of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Show Hex colorcodes in editor
"Plug 'lilydjwg/colorizer'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Floating terminal
Plug 'voldikss/vim-floaterm'

"Cmake
Plug 'cdelledonne/vim-cmake'

" Statusbar / Lightline
Plug 'itchyny/lightline.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Comment out convenience
Plug 'tpope/vim-commentary'

call plug#end()
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
let g:perl_host_prog = '/usr/bin/perl'

let g:loaded_matchparen=1

let g:floaterm_position = 'bottom'
let g:floaterm_width = 1.0
let g:floaterm_heigth = 0.4

nmap <C-t> :FloatermNew vifm<CR>

let g:cmake_link_compile_commands = 1
nmap <leader>cg :CMakeGenerate<CR>
nmap <leader>cb :CMakeBuild<CR>
nmap <leader>cc :CMakeClose<CR>
nmap <leader>cl :CMakeClean<CR>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-e>"

" Colorscheme
"let g:gruvbox_invert_selection=0
"let g:gruvbox_contrast_dark='hard'
set termguicolors
set background=dark
colorscheme base16-hedric

" Ripgrep etc
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

set noswapfile

set nohlsearch
set mouse=a
set number
set nowrap

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Open-hotkeys
" map <C-f> :ProjectFiles<CR>
nnoremap <C-f> <cmd>Telescope find_files<CR> 
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>

" Quick-save
nmap <leader>w :w<CR>

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use wide tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Always centre moving up and down with ctrl u or d
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz

" Fix split screen movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Cursorline
set cursorline
"hi Cursorline cterm=NONE ctermbg=NONE guibg=Grey12

" Ctrl+h to stop searching
"vnoremap <C-h> :nohlsearch<cr>
"nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
" noremap <leader>p :read !xsel --clipboard --output<cr>
 "noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
" noremap <leader>g :Rg<CR>
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Buffers call fzf#vim#buffers(<q-args>, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" Help filetype detection
autocmd BufRead Makefile.* set filetype=make

" Source config for Conqueror of Completion
source $HOME/.config/nvim/plug-config/coc.vim

