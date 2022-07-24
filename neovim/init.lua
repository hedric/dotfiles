
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'wbthomason/packer.nvim'
  use 'chrisbra/vim-commentary'
  use 'nvim-lualine/lualine.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'norcalli/nvim-colorizer.lua'
  use 'ryanoasis/vim-devicons'
  use 'hedric/nvim-solarized-lua'
  use 'tpope/vim-surround'
-- use 'lukas-reineke/indent-blankline.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'jakemason/ouroboros'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Colorschemes
  use 'marko-cerovac/material.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'joshdick/onedark.vim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Buffer encoding
vim.o.encoding = 'utf-8'
-- Save when switching buffers
vim.o.autowriteall = true
-- Make line numbers default
vim.wo.number = true
-- Add line width marker
vim.o.colorcolumn = '81'
-- Show signs in the number column
vim.wo.signcolumn = 'number'

-- Use ESC to exit insert mode in :term
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Global statusline
vim.opt.laststatus = 3

-- Color theme
vim.o.termguicolors = true
vim.o.background = 'dark'
-- vim.g.solarized_italics = 0
vim.cmd('colorscheme kanagawa')

-- Lualine
require('lualine').setup({
    options = {
        theme = 'material',
        icons_enabled = false,
        section_separators = '',
        component_separators = ''
    }
})

-- Colorizer
require('colorizer').setup {}

-- Formatter
vim.opt.list = false
vim.opt.listchars:append("eol:↴")
-- require('indent_blankline').setup {
-- show_end_of_line = false,
-- }

vim.g.indent_blankline_char = '¦'

-- Mouse settings
vim.opt.mouse = 'a'

vim.opt.signcolumn = "yes"

-- Custom settings
vim.opt.swapfile = false

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = false

vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.breakindent = true
vim.opt.hidden = true
vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.undofile = true

vim.opt.wildmenu = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

-- Custom keymappings
local opts = { noremap = true, silent=true }
vim.g.mapleader = ' '
vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', '<c-u>', '<c-u>zz', opts)
vim.keymap.set('n', '<c-d>', '<c-d>zz', opts)
vim.keymap.set('n', 'H', '^', opts)
vim.keymap.set('n', 'L', '$', opts)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>,', ':set invlist<CR>', opts)
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', opts)
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)

-- Clipboard
vim.keymap.set({'n','x'}, 'cp', '"+y')
vim.keymap.set({'n','x'}, 'cv', '"+p')

-- Select all test in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Telescope
vim.keymap.set('n', '<c-f>', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>f', ':Telescope git_status<CR>', opts)

-- LSP stuff
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('nvim-treesitter.configs').setup{
    ensure_installed = { "c", "cpp", "lua", "python", "bash" },

    sync_install = false,
    auto_isntall = true,
    ignore_install = { "javascript" },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
