-- Options

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

-- Telescope freeze otherwise
vim.opt.paste = false


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
vim.keymap.set('n', '<leader>,', ':set invlist<CR>', keyopts)
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', keyopts)
vim.keymap.set('n', '<leader>q', ':q<CR>', keyopts)
-- Rebind annoying record with q to Q
vim.keymap.set('n', 'Q', 'q', keyopts)
vim.keymap.set('n', 'q', '<Nop>', keyopts)
vim.keymap.set({'n','x'}, 'cp', '"+y')
vim.keymap.set({'n','x'}, 'cv', '"+p')

-- Primagen
-- vim.keymap.set("x", "<leader>p", "\"_dP")

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

-- Mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup {
	{"tpope/vim-fugitive"},
	{"chrisbra/vim-commentary"},
	{ 'numToStr/Comment.nvim', opts = {} },

	-- Colorscheme
	{"navarasu/onedark.nvim",
	enabled = false,
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = 'darker',

			code_style = {
				comments = 'none'
			},

			colors = {
				green = '#3DCC98'
			},
			-- Remember to "TSInstall comment"
			-- for TODO/NOTE/WARNING highlighting
			highlights = {
				TSNote = {fg = '$red', fmt = 'bold'},
				TSWarning = {fg = '$red', fmg = 'bold'}

			},
		})
		-- load the colorscheme here
		vim.cmd([[colorscheme onedark]])
	end,
    },

    {"nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = 'tokyonight',
            component_separators = '|',
            section_separators = '',
            },
        },
    },

	-- Inactive colorscheme
    {"bluz71/vim-moonfly-colors",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme moonfly]])
        end,
    },

    {"catppuccin/nvim",
    as = "catppuccin",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme catppuccin]])
        end,
    },

    {"folke/tokyonight.nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("tokyonight").setup({
            style = 'night',
            on_colors = function(colors)
                colors.bg = "#0d0d0d"
                colors.fg = "#b3b3b3"
            end,
            on_highlights = function(hl, c)
                hl.CursorLine = {
                    bg = "#1a1a1a",
                }
            end,
        })
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
    end,
},
    
    
    -- LSP Support
    {'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
        },
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            lsp.ensure_installed({
                'clangd',
                'pyright',
                'rust_analyzer',
            })
            lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({buffer = bufnr})
            end)
            lsp.setup()
            
            -- Autocompletion
            local cmp = require('cmp')
            cmp.setup({
                mapping = {
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({select = false}),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                }
            })
        end 
    },
    {'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust", "bash"},
                highlight = { enable = true, }
            }
        end 
    },
    {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
        
    },
}

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>f', builtin.help_tags, {})

