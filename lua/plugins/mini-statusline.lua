return {
  'nvim-mini/mini.statusline',
  version = '*',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = false }
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function() return string.format('chars: %d', vim.fn.wordcount().chars) end
  end,
}
