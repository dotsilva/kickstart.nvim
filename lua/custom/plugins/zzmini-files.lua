return {
  'nvim-mini/mini.files',
  keys = {
    { '<leader>o', function() require('mini.files').open(vim.api.nvim_buf_get_name(0), true) end, desc = 'Open mini.files (Current File)' },
    { '<leader>O', function() require('mini.files').open(vim.uv.cwd(), true) end, desc = 'Open mini.files (CWD)' },
  },
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
  config = function(_, opts)
    require('mini.files').setup(opts)
  end,
}
