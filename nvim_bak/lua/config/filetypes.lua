-- Set correct filetype for Makefile.* extension
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('detect_makefile', { clear = true }),
  desc = 'Set filetype for Makefile.* files',
  pattern = { 'Makefile.*' },
  callback = function()
    vim.cmd('set filetype=make')
  end,
})

