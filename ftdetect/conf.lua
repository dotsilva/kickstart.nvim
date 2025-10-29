-- ~/.config/nvim-kickstart/ftdetect/conf.lua
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.conf' },
  command = 'set filetype=ini',
})
