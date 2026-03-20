return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'mocha',
      term_colors = false,
      color_overrides = {
        mocha = {
          base = '#0C0C0C',
          mantle = '#0C0C0C',
          crust = '#0C0C0C',
          surface0 = '#484848',
          surface1 = '#484848',
          surface2 = '#484848',
          overlay0 = '#484848',
          overlay1 = '#484848',
          overlay2 = '#484848',
          text = '#C2AE93',
          subtext0 = '#C2AE93',
          subtext1 = '#C2AE93',
          red = '#B83E46',
          maroon = '#B83E46',
          peach = '#DCAE3D',
          yellow = '#DCAE3D',
          green = '#838F46',
          teal = '#4AA893',
          sky = '#4AA893',
          lavender = '#6C9FBF',
          sapphire = '#6C9FBF',
          blue = '#6C9FBF',
          rosewater = '#8B476D',
          flamingo = '#8B476D',
          pink = '#8B476D',
          mauve = '#8B476D',
        },
      },
      custom_highlights = function(c)
        return {
          Cursor = { fg = c.base, bg = c.teal },
          lCursor = { fg = c.base, bg = c.teal },
          CursorIM = { fg = c.base, bg = c.teal },
          Search = { fg = c.base, bg = c.teal },
          IncSearch = { fg = c.base, bg = c.teal },
          Visual = { bg = c.teal, fg = c.base, bold = true },
          CursorLine = { bg = 'NONE', underdouble = true, sp = c.teal },
          CursorLineNr = { fg = c.teal, bold = true },
          Pmenu = { fg = c.text, bg = c.base },
          PmenuSel = { fg = c.base, bg = c.teal, bold = true },
          PmenuSbar = { bg = c.base },
          PmenuThumb = { bg = c.surface0 },
          WildMenu = { fg = c.base, bg = c.teal, bold = true },
          BlinkCmpMenu = { fg = c.text, bg = c.base },
          BlinkCmpMenuSelection = { fg = c.base, bg = c.teal, bold = true },
          BlinkCmpLabel = { fg = c.text },
          BlinkCmpLabelMatch = { fg = c.teal, bold = true },
          LspReferenceText = { fg = c.teal, bg = 'NONE', bold = true, italic = true },
          LspReferenceRead = { fg = c.teal, bg = 'NONE', bold = true, italic = true },
          LspReferenceWrite = { fg = c.teal, bg = 'NONE', bold = true, italic = true },
          TelescopeMatching = { fg = c.teal, bold = true },
          TelescopeSelectionCaret = { fg = c.teal },
          TelescopeBorder = { fg = c.surface0 },
          TelescopePromptBorder = { fg = c.teal },
          Comment = { fg = c.surface0, italic = true },

          -- Replaced Snacks.nvim with mini.indentscope
          IblScope = { fg = c.teal, bold = true },

          FlashLabel = { fg = c.base, bg = c.teal, bold = true },
          FlashMatch = { fg = c.text, bg = c.surface0 },
          FlashCurrent = { fg = c.base, bg = c.teal, bold = true },
          ['@punctuation'] = { fg = c.mauve },
          ['@punctuation.bracket'] = { fg = c.mauve },
          ['@punctuation.delimiter'] = { fg = c.mauve },
          ['@punctuation.special'] = { fg = c.mauve },
          ['@operator'] = { fg = c.mauve },
          ['@keyword'] = { fg = c.mauve, italic = true },
          ['@keyword.control'] = { fg = c.mauve, italic = true, bold = true },
        }
      end,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      -- Kickstart does not automatically set the colorscheme like LazyVim does. You must explicitly call it here.
      vim.cmd.colorscheme 'catppuccin'

      -- Native UI Overrides previously handled by the LazyVim Core plugin
      vim.diagnostic.config { float = { border = 'single' } }
      vim.o.winborder = 'single'
    end,
  },

  -- UI border overrides for plugins naturally loaded by Kickstart
  {
    'folke/which-key.nvim',
    opts = { win = { border = 'single' } },
  },
  {
    'mason-org/mason.nvim',
    opts = { ui = { border = 'single' } },
  },
  {
    'nvim-telescope/telescope.nvim',
    opts = { defaults = { borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' } } },
  },
  {
    'saghen/blink.cmp',
    opts = {
      completion = {
        menu = { border = 'single' },
        documentation = { window = { border = 'single' } },
      },
      signature = { window = { border = 'single' } },
    },
  },
}
