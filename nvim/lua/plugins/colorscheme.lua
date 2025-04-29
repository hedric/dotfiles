return {
"navarasu/onedark.nvim",
	config = function()
	local onedark = require("onedark")

	onedark.setup {
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
	}
    vim.cmd('colorscheme onedark')
  end
}
