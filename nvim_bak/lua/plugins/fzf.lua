return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
    local fzf = require("fzf-lua")
    fzf.setup {
    }
    end,
    keys = {
        {
            "<C-t>",
            ":FzfLua complete_path<CR>",
            mode = { "n" },
            desc = "Complete path",
            silent = true,
        },
        {
            "<C-f>",
            ":FzfLua git_files<CR>",
            mode = { "n" },
            desc = "git ls-files",
            silent = true,
        },
        {
            "<leader>f",
            ":FzfLua files<CR>",
            mode = { "n" },
            desc = "find or fd on a path",
            silent = true,
        },
        {
            "<leader>g",
            ":FzfLua live_grep<CR>",
            mode = { "n" },
            desc = "live grep current project",
            silent = true,
        },
        {
            "<leader>b",
            ":FzfLua buffers<CR>",
            mode = { "n" },
            desc = "open buffers",
            silent = true,
        },
    },
}
