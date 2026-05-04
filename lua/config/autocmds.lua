-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
  callback = function(args) vim.api.nvim_win_set_config(args.data.win_id, { border = 'double' }) end,
})
