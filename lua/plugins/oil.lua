return {
  'stevearc/oil.nvim',
  dependencies = {}, -- Zero dependencies. No icons. Pure logic.
  lazy = false,
  keys = {
    { '<leader>o', function() require('oil').toggle_float() end, desc = 'Open Oil (Current File)' },
    { '<leader>O', function() require('oil').toggle_float(vim.uv.cwd()) end, desc = 'Open Oil (CWD)' },
  },
  opts = {
    default_file_explorer = true,
    columns = {}, -- Empty table = No icons, no size scans, no mtime. Just text.
    view_options = {
      show_hidden = true,
    },
    -- The Floating Window (Replacing mini.files columns)
    float = {
      padding = 2,
      max_width = 0.9,
      max_height = 0.8,
      border = 'double', -- Strong square borders
      win_options = {
        -- Force the window to use our custom highlight groups below
        winhighlight = 'Normal:OilNormal,FloatBorder:OilBorder,FloatTitle:OilTitle',
      },
    },

    -- Preview Window (Hit <C-p> inside Oil to toggle it)
    preview_win = {
      update_on_cursor_moved = true,
    },
  },
}
