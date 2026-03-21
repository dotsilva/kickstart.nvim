return {
  'nvim-mini/mini.pick',
  dependencies = { 'nvim-mini/mini.extra' },
  keys = {
    { '<leader><leader>', function() require('mini.pick').builtin.buffers() end, desc = 'Find existing buffers' },
    { '<leader>sf', function() require('mini.pick').builtin.files() end, desc = 'Search Files' },
    { '<leader>sg', function() require('mini.pick').builtin.grep_live() end, desc = 'Search by Grep' },
    { '<leader>sw', function() require('mini.pick').builtin.grep({ pattern = vim.fn.expand('<cword>') }) end, desc = 'Search current Word' },
    { '<leader>sh', function() require('mini.pick').builtin.help() end, desc = 'Search Help' },
    { '<leader>sr', function() require('mini.pick').builtin.resume() end, desc = 'Search Resume' },
    { '<leader>sd', function() require('mini.extra').pickers.diagnostic() end, desc = 'Search Diagnostics' },
    { '<leader>s.', function() require('mini.extra').pickers.oldfiles() end, desc = 'Search Recent Files' },
    { '<leader>sk', function() require('mini.extra').pickers.keymaps() end, desc = 'Search Keymaps' },
    { '<leader>sc', function() require('mini.extra').pickers.commands() end, desc = 'Search Commands' },
    { '<leader>sn', function() require('mini.pick').builtin.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Search Neovim files' },
  },
  opts = {
    window = {
      config = { border = 'single' },
    },
  },
  config = function(_, opts)
    require('mini.pick').setup(opts)
    require('mini.extra').setup()
    -- Override default UI select to use mini.pick
    vim.ui.select = require('mini.pick').ui_select
  end,
}
