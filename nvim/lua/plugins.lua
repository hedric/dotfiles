vim.pack.add({
      { src = "https://github.com/neovim/nvim-lspconfig" },
      { src = "https://github.com/mason-org/mason.nvim" },
      { src = "https://github.com/Saghen/blink.cmp", dependencies = { "rafamadriz/friendly-snippets" }},
      { src = "https://github.com/stevearc/oil.nvim" },
      { src = "https://github.com/metalelf0/black-metal-theme-neovim" },
      { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
      { src = "https://github.com/nvim-lualine/lualine.nvim" },
      { src = "https://github.com/nvim-mini/mini.pick" },
      { src = "https://github.com/windwp/nvim-autopairs" },
      { src = "https://github.com/mfussenegger/nvim-dap" },
      { src = "https://github.com/nvim-neotest/nvim-nio" },
      { src = "https://github.com/rcarriga/nvim-dap-ui" },
      { src = "https://github.com/tpope/vim-fugitive" },
      { src = "https://github.com/navarasu/onedark.nvim" },
      { src = "https://github.com/github/copilot.vim" },
})

-- Code completion
-- cd ~/.local/share/nvim/site/pack/core/opt/blink.cmp
-- cargo build --release
require("blink.cmp").setup({
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = false },
        completion = { documentation = { auto_show = false } },
        keymap =
        {
            preset = 'enter',
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path' },
        },
})

-- LSP
require("mason").setup()
vim.lsp.enable({
  "clangd",
  "rust_analyzer",
  "pyright",
  "bashls",
  "lua_ls",
})

-- Get rid of global vim warning
vim.lsp.config("lua_ls",{
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

-- Oil (File explorer replacement for netrw)
require("oil").setup()

-- Black metal setup
require("black-metal").setup({
    theme = "bathory",
    variant = "dark",
    code_style = {
        comments = "none",
    },
    colors = {
        background = '#080808',
        diff_green = '#14412a',
        diff_red = '#6e4c4c',
        diff_change = '#2c4956',
    },
    highlights = {
        Normal = { bg = "$background" },
        NormalNC = { bg = "$background" },
        SignColumn = { bg = "$background" },
        ColorColumn = { bg = "$background" },
        LineNr         = { bg = "$background" },
        CursorLine     = { bg = "$background" },
        CursorLineSign = { bg = "$background" },
        CursorLineNr   = { bg = "$background" },
        DiffAdd = {bg = "$diff_green"},
        DiffDelete = {bg = "$diff_red"},
        DiffChange = {bg = "$diff_change"},
        DiffText = {bg = "$diff_change"},
    }
})

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
        Operator = {fg = '$fg'},
        ["@lsp.type.enumMember"] = { fg = '$fg' },
        Enum = {fg = '$blue'},
        TSNote = {fg = '$red', fmt = 'bold'},
        TSWarning = {fg = '$red', fmg = 'bold'}
    },
})

vim.cmd.colorscheme("onedark")

-- Treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "cpp",
        "rust",
        "devicetree",
        "bitbake",
        "cmake",
        "make",
        "bash",
        "dockerfile",
        "gitignore",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "sql",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = false,
        additional_vim_regex_highlighting = false,
    },
}

-- Statusline
require("lualine").setup({
    options = {
        icons_enabled = false,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
})

-- File finder
require("mini.pick").setup()

-- mini.pick highlight overrides
local highlight = vim.api.nvim_set_hl
highlight(0, 'MiniPickMatchCurrent',  { link='PmenuThumb' })
highlight(0, 'MiniPickMatchMarked',   { link='FloatTitle' })
highlight(0, 'MiniPickMatchRanges',   { link='FloatTitle' })
highlight(0, 'MiniPickPreviewRegion', { link='PmenuThumb' })

require("nvim-autopairs").setup({
})

vim.diagnostic.config({
    virtual_text = true,
    --virtual_lines = { current_line = false },
    wrap = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    signs = {
      text = {
        -- If you want custom icons for the diagnostics
        -- [vim.diagnostic.severity.ERROR] = "",
        -- [vim.diagnostic.severity.WARN] = "",
        -- [vim.diagnostic.severity.INFO] = "",
        -- [vim.diagnostic.severity.HINT] = "",
      },
    },
    float = {
      border = "rounded",
      source = "if_many",
    },
})

local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = false,
        underline = false,
    })
end

local function show_diagnostics()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end

-- Plugin specific keybinds
local keyopts = { noremap = true, silent = true}
vim.keymap.set('n', '<C-f>', ':Pick files<CR>', keyopts)
vim.keymap.set('n', '<leader>g', ':Pick grep_live<CR>', keyopts)
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>', keyopts)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keyopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, keyopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, keyopts)

-- Hide diagnostics
vim.keymap.set("n", "<leader>dh", hide_diagnostics)
vim.keymap.set("n", "<leader>ds", show_diagnostics)
