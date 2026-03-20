return {
  -- Configure Oil
  {
    'stevearc/oil.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>o', function() require('oil').open() end, desc = 'Open Oil Explorer' },
    },
    opts = {
      default_file_explorer = false,
      columns = { 'icon' },
      view_options = { show_hidden = true },
      keymaps = {
        ['<leader>o'] = 'actions.close',
        ['<CR>'] = 'actions.select', -- Opens file in current window
      },
    },
    config = function(_, opts)
      require('oil').setup(opts)

      -- Open Oil on startup if no file arguments are passed
      vim.api.nvim_create_autocmd('VimEnter', {
        nested = true,
        callback = function()
          if vim.fn.argc() == 0 then
            local ft = vim.bo.filetype
            if ft ~= 'oil' and ft ~= 'lazy' and ft ~= 'mason' then require('oil').open() end
          end
        end,
      })
    end,
  },
}
