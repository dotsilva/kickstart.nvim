return {
  -- 2. DRESSING (from pcdressfix.lua)
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy', -- default for kickstart ui plugins
  },

  -- 3. SNACKS (Corrected as per :checkhealth)
  {
    'folke/snacks.nvim',
    lazy = false, -- <--- 1: (was 'event = VeryLazy')
    priority = 1000, -- <--- 2: Added priority
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
    },
  },
  -- vertical line
  {
    'echasnovski/mini.indentscope',
    version = false, -- or it might have a version tag

    -- This function disables the plugin for the listed filetypes/buftypes
    enabled = function()
      -- Set of filetypes to disable
      local disabled_fts = {
        help = true,
        dashboard = true,
        lazy = true,
        mason = true,
        NvimTree = true,
        Trouble = true,
      }

      -- Set of buftypes to disable
      local disabled_bts = {
        terminal = true,
        nofile = true,
      }

      -- If the current filetype or buftype is in the list, return 'false' (disabled)
      if disabled_fts[vim.bo.filetype] or disabled_bts[vim.bo.buftype] then
        return false
      end

      -- Otherwise, return 'true' (enabled)
      return true
    end,

    -- Options for the plugin
    opts = {
      -- You can uncomment and change the symbol if you want
      symbol = '│',
      options = { try_as_border = true },
      -- Add this line to disable animation:
      draw = { animation = require('mini.indentscope').gen_animation.none() },
    },
  },
}
