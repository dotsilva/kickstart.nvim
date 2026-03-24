return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'zidhuss/neotest-minitest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-minitest',
      },
    }
    vim.keymap.set('n', '<leader>tr', function() require('neotest').run.run() end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, { desc = 'Run file tests' })
  end,
}
