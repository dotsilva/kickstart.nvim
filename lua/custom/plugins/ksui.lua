return {
  -- 2. DRESSING (from pcdressfix.lua)
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy', -- default for kickstart ui plugins
  },

  -- 3. SNACKS (Corrected as per :checkhealth)
  {
    'folke/snacks.nvim',
    lazy = false, -- <--- CORREÇÃO 1: (was 'event = VeryLazy')
    priority = 1000, -- <--- CORREÇÃO 2: Added priority
    opts = {
      scroll = {
        enabled = false, -- Disable scrolling animations
      },
      -- NOTA: O 'dashboard' do snacks não está habilitado.
      -- Isso permite que o alpha-nvim funcione sem conflito.
    },
  },
  -- vertical line
  {
    'echasnovski/mini.indentscope',
    version = false, -- or it might have a version tag
    opts = {
      -- You can uncomment and change the symbol if you want
      symbol = '│',
      options = { try_as_border = true },
      -- Add this line to disable animation:
      draw = { animation = require('mini.indentscope').gen_animation.none() },
    },
  },
  -- alpha-nvim dashboard (Restored)
  {
    'goolord/alpha-nvim',
    lazy = false,
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = vim.split(
        [[
                                   .-----.          
        .----------------------.   | === |          
        |.-""""""""""""""""""-.|   |-----|          
        ||                    ||   | === |          
        ||   KICKSTART.NVIM   ||   |-----|          
        ||                    ||   | === |          
        ||                    ||   |-----|          
        ||:Tutor              ||   |:::::|          
        |'-..................-'|   |____o|          
        `"")----------------(""`   ___________      
       /::::::::::|  |::::::::::\  \ no mouse \     
      /:::========|  |==hjkl==:::\  \ required \    
     '""""""""""""'  '""""""""""""'  '""""""""""'   
]],
        '\n'
      )

      dashboard.section.buttons.val = {
        dashboard.button('e', 'New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', 'Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('q', 'Quit Neovim', ':qa<CR>'),
      }

      dashboard.section.header.opts.hl = 'Type'
      dashboard.section.buttons.opts.hl = 'Function'
      dashboard.opts.layout[1].val = 2

      alpha.setup(dashboard.config)
    end,
  },
}
