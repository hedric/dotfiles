-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Disable netrw because we are using nvim-tree
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.background = 'dark'
vim.opt.mouse = 'a'
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.list = false
vim.opt.foldenable = false
vim.o.splitright = true
-- Telescope freeze otherwise
--vim.opt.paste = false
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.o.winborder = 'rounded'

