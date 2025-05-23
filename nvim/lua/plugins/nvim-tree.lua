return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 30,
        relativenumber = true,
      },
      renderer = {
          group_empty = true,
      },
      filters = {
        custom = {},
      },
    })
  end,
  keys = {
    {
      "<leader>t",
      ":NvimTreeToggle<CR>",
      mode = { "n" },
      desc = "Toggle file explorer",
    },
  },
}
