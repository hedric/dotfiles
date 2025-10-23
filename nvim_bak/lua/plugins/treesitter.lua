return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
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
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
