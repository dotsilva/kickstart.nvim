return {
  'nvim-mini/mini.clue',
  event = 'VeryLazy',
  config = function()
    local miniclue = require 'mini.clue'
    miniclue.setup {
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'i', keys = '<C-x>' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
      },
      clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        -- Kickstart Group Equivalents
        { mode = 'n', keys = '<Leader>s', desc = '+[S]earch' },
        { mode = 'n', keys = '<Leader>t', desc = '+[T]oggle' },
        { mode = 'n', keys = '<Leader>h', desc = '+Git [H]unk' },
        { mode = 'n', keys = '<Leader>b', desc = '+[B]ible' },
        { mode = 'n', keys = 'gr', desc = '+LSP Actions' },
      },
      window = {
        config = { border = vim.g.strong_border },
        delay = 0,
      },
    }
  end,
}
