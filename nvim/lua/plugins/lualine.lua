return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    local lualine = require("lualine")

    lualine.setup {
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
    }
    end,
}
