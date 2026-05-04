return {
  'nvim-mini/mini.indentscope',
  version = '*',
  event = 'VeryLazy',
  config = function()
    require('mini.indentscope').setup {
      symbol = '▎',
      options = { try_as_border = true },
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
      },
    }
  end,
}
