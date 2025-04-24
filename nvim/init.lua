-- Options

-- Disable netrw because we are using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.expandtab = true
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

vim.opt.list = true

-- Telescope freeze otherwise
vim.opt.paste = false

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keybindings
local keyopts = { noremap = true, silent = true}
vim.keymap.set('n', '<c-h>', '<c-w>h', keyopts)
vim.keymap.set('n', '<c-j>', '<c-w>j', keyopts)
vim.keymap.set('n', '<c-k>', '<c-w>k', keyopts)
vim.keymap.set('n', '<c-l>', '<c-w>l', keyopts)
vim.keymap.set('n', 'n', 'nzzzv', keyopts)
vim.keymap.set('n', 'N', 'Nzzzv', keyopts)
vim.keymap.set('n', '<c-u>', '<c-u>zz', keyopts)
vim.keymap.set('n', '<c-d>', '<c-d>zz', keyopts)
vim.keymap.set('n', 'J', 'mzJ`z', keyopts)
vim.keymap.set('n', 'L', '$', keyopts)
vim.keymap.set('n', 'H', '^', keyopts)
vim.keymap.set('n', 'L', '$', keyopts)
vim.keymap.set('n', '<leader>w', ':w<CR>', keyopts)
vim.keymap.set('n', '<leader>q', '<C-w>q', keyopts)
vim.keymap.set('n', '<leader>,', ':set invlist<CR>', keyopts)
-- Rebind annoying record with q to Q
vim.keymap.set('n', 'Q', 'q', keyopts)
vim.keymap.set('n', 'q', '<Nop>', keyopts)
vim.keymap.set({'n','x'}, 'cp', '"+y')
vim.keymap.set({'n','x'}, 'cv', '"+p')

-- Move lines up and down (Primagen)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", keyopts)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", keyopts)

-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    {"tpope/vim-fugitive"},
    {"chrisbra/vim-commentary"},
    { 'numToStr/Comment.nvim', opts = {} },
    {"navarasu/onedark.nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            style = 'darker',
            --transparent = '',
            --terminal_colors = 'true',

            code_style = {
                comments = 'none'
            },

            colors = {
                green = '#3DCC98',
            },
            -- Remember to "TSInstall comment"
            -- for TODO/NOTE/WARNING highlighting
            highlights = {
                TSNote = {fg = '$red', fmt = 'bold'},
                TSWarning = {fg = '$red', fmg = 'bold'}

            },
        })
        vim.cmd([[colorscheme onedark]])
        require('onedark').load()

    end,
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        },
    },
    {"nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = 'onedark',
            component_separators = '|',
            section_separators = '',
            },
        sections = {
            lualine_a = {
                {
                    'mode',
                    'searchcount',
                    maxcount = 999,
                    timeout = 500,
                }
            }
        },
    },
    },

    {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup{
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            }
        end,
    },
    {'ibhagwan/fzf-lua',
        config = function()
            require('fzf-lua').setup {
                keymap = {},
            }
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },
} -- End of lazy config

-- NvimTree
local api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>t', api.tree.toggle, {})

-- Fzf-lua keymaps
vim.keymap.set({ "n", "v", "i" }, "<C-t>",
  function() require("fzf-lua").complete_path() end,
  { silent = true, desc = "fuzzy complete path" })

vim.keymap.set({ "n", "v" }, "<C-f>",
function() require("fzf-lua").git_files() end,
{ silent = true, desc = "git ls-files" })

vim.keymap.set({ "n", "v" }, "<leader>f",
function() require("fzf-lua").files() end,
{ silent = true, desc = "find or fd on a path" })

vim.keymap.set({ "n", "v" }, "<leader>g",
function() require("fzf-lua").live_grep() end,
{ silent = true, desc = "live grep current project" })

vim.keymap.set({ "n", "v" }, "<leader>b",
function() require("fzf-lua").buffers() end,
{ silent = true, desc = "open buffers" })
