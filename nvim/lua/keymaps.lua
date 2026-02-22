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

-- Convent move for going from insert mode to eol insert mode
vim.keymap.set('i', '<C-l>', '<Esc>g$a', keyopts)

-- Move lines up and down (Primagen)
--vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", keyopts)
--vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", keyopts)

-- Disable bindings
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grn')

-- 10 lines per scroll tick
vim.keymap.set("n", "<ScrollWheelUp>", "5<C-y>", { silent = true })
vim.keymap.set("n", "<ScrollWheelDown>", "5<C-e>", { silent = true })

-- (optional) same behavior in visual mode
vim.keymap.set("v", "<ScrollWheelUp>", "5<C-y>", { silent = true })
vim.keymap.set("v", "<ScrollWheelDown>", "5<C-e>", { silent = true })
