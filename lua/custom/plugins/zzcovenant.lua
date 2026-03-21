return {
  {
    'nvim-mini/mini.base16',
    lazy = false,
    priority = 1000,
    config = function()
      local palette = {
        -- Background & UI (Darkness scale)
        base00 = '#0C0C0C', -- darkness_6 (Main background)
        base01 = '#181818', -- darkness_5 (Lighter background/Statusline)
        base02 = '#303030', -- darkness_3 (Selection/Hover)
        base03 = '#484848', -- darkness_1 (Comments/Line numbers)

        -- Foreground (Broken Bread scale)
        base04 = '#8A7C6B', -- broken_bread_4 (Dark text)
        base05 = '#C2AE93', -- broken_bread_1 (Main text)
        base06 = '#C2AE93', -- broken_bread_1 (Light text)
        base07 = '#C2AE93', -- broken_bread_1 (Lightest text)

        -- Semantics (8 strict ANSI equivalents)
        base08 = '#B83E46', -- poured_wine_1 (Red / Errors / Deletions)
        base09 = '#DCAE3D', -- royal_sash_1  (Orange / Warnings)
        base0A = '#DCAE3D', -- royal_sash_1  (Yellow / Classes)
        base0B = '#838F46', -- gethsemane_1  (Green / Strings / Additions)
        base0C = '#4AA893', -- water_of_life_1 (Cyan / Regex / Visual Anchors)
        base0D = '#6C9FBF', -- first_day_1   (Blue / Functions)
        base0E = '#8B476D', -- thorned_veil_1 (Magenta / Keywords)
        base0F = '#B83E46', -- poured_wine_1 (Brown fallback to Red / Deprecated)
      }

      require('mini.base16').setup {
        palette = palette,
        use_cterm = true,
      }

      -- Enforce semantic rules bypassed by Base16 defaults to maintain your worldview
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = palette.base0A, bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = palette.base0A, bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = palette.base0A, bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = palette.base0A, bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = palette.base0A, bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = palette.base0C, bg = 'NONE' })

      -- Native UI Overrides
      vim.diagnostic.config { float = { border = 'single' } }
      vim.o.winborder = 'single'
    end,
  },

  -- UI border overrides for Kickstart/Ecosystem plugins
  { 'folke/which-key.nvim', opts = { win = { border = 'single' } } },
  { 'mason-org/mason.nvim', opts = { ui = { border = 'single' } } },
  { 'nvim-telescope/telescope.nvim', opts = { defaults = { borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' } } } },
  {
    'saghen/blink.cmp',
    opts = {
      completion = { menu = { border = 'single' }, documentation = { window = { border = 'single' } } },
      signature = { window = { border = 'single' } },
    },
  },
}
