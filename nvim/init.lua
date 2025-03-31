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

    {"navarasu/onedark.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            style = 'darker',
            transparent = 'false',
            term_colors = 'true',

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
        require('onedark').load()

    end,
    },
    {"folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("tokyonight").setup({})
        -- load the colorscheme here
    end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = false,
                    terminal_colors = true,
                    module_default = true,
                    styles = {
                        comments = "NONE",
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                        variables = "NONE",
                    },
                    inverse = {
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    -- List of various plugins and additional options
                    modules = {
                    },
                },
                palettes = {
                    carbonfox = {
                        green = "#3DCC98",
                    },

                },
                specs = {
                      all = {
                          fg1 = "fg2",
                          syntax = {
                              preproc = "cyan.bright",
                              variable = "fg2",
                              keyword = "yellow.dim",
                              func = "fg3",
                              -- field = "fg2",
                              type = "yellow.dim",
                              -- ident = "fg2",
                              -- const = "fg2",
                              statement = "fg2",
                              conditional = "fg3",
                              -- dep = "fg3",
                              builtin0 = "blue",
                              builtin1 = "yellow.dim",
                              operator = "fg2"
                              --builtin2 = "fg3",
                              --builtin3 = "fg3",
                          },
                    },
                },
                groups = {},
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme carbonfox]])
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
            theme = 'codedark',
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
    {'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup {
            defaults = {
                file_sorter =  require'telescope.sorters'.get_fzy_sorter,
                generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
            }
        }
    end
    },
    { "nvim-treesitter/nvim-treesitter",
        enabled = true,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "cpp", "c", "lua", "rust", "bash", "vimdoc", "lua"},
                highlight = { enable = true, }
            }
        end
    },
    {'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {'folke/noice.nvim',
        event = "VeryLazy",
        enabled = false,
        opts = {},
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
        require("noice").setup{
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                ntreinc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        }
    end
    },

    {'mfussenegger/nvim-dap'},
    {'rcarriga/nvim-dap-ui'},
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
    {'ckipp01/nvim-jenkinsfile-linter', 
	dependecnies = { "nvim-lua/plenary.nvim" },
    },
} -- End of lazy config


-- NvimTree
local api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>t', api.tree.toggle, {})

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
