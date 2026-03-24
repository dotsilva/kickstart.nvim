return {
  'nvim-mini/mini.diff',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    { '<leader>hp', function() require('mini.diff').toggle_overlay() end, desc = 'Toggle git diff overlay' },
    { '<leader>hs', function() require('mini.diff').textobject() end, desc = 'Select hunk context' },
  },
  opts = {
    view = {
      style = 'sign',
      signs = { add = '+', change = '~', delete = '_' },
    },
    -- Maps standard Kickstart hunk actions
    mappings = {
      apply = '<leader>hs',
      reset = '<leader>hr',
      textobject = 'gh',
      goto_first = '[H',
      goto_prev = '[c',
      goto_next = ']c',
      goto_last = ']H',
    },
  },
  config = function(_, opts) require('mini.diff').setup(opts) end,
}
