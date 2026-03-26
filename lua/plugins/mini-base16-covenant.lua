return {
  'nvim-mini/mini.base16',
  lazy = false,
  priority = 1000,
  config = function()
    local palette = {
      -- Background & UI (Darkness scale)
      base00 = '#0C0C0C', -- darkness_6 (Main background)
      base01 = '#242424', -- darkness_4 (Lighter background/Statusline)
      base02 = '#3C3C3C', -- darkness_2 (Selection/Hover)
      base03 = '#545454', -- darkness_0 (Comments/Line numbers)

      -- Foreground (Broken Bread scale)
      base04 = '#AA967B', -- broken_bread_4 (Dark text)
      base05 = '#CEBA9F', -- broken_bread_1 (Main text)
      base06 = '#CEBA9F', -- broken_bread_1 (Light text)
      base07 = '#CEBA9F', -- broken_bread_1 (Lightest text)

      -- Semantics (Accents)
      base08 = '#D0565E', -- poured_wine_1 (Red / Critical / Exit)
      base09 = '#F4C655', -- royal_sash_1  (Orange / Warnings)
      base0A = '#F4C655', -- royal_sash_1  (Yellow / Attention / Mid-state)
      base0B = '#9BA75E', -- gethsemane_1  (Green / Healthy / Data)
      base0C = '#56B49F', -- water_of_life_1 (Cyan / Ephemeral / Active)
      base0D = '#487B9B', -- first_day_1   (Blue / Static / Types)
      base0E = '#975379', -- thorned_veil_1 (Magenta / Wildcard)
      base0F = '#D0565E', -- poured_wine_1 (Brown fallback to Red)
    }

    require('mini.base16').setup {
      palette = palette,
      use_cterm = true,
    }
    -- SYNTAX LOGIC
    -- 1. White: Standard neutral generic labels & executable structure
    vim.api.nvim_set_hl(0, '@variable', { fg = palette.base05 })
    vim.api.nvim_set_hl(0, '@property', { fg = palette.base05 })
    vim.api.nvim_set_hl(0, '@variable.member', { fg = palette.base05 })
    vim.api.nvim_set_hl(0, '@operator', { fg = palette.base05 })
    vim.api.nvim_set_hl(0, '@punctuation', { fg = palette.base05 })
    vim.api.nvim_set_hl(0, '@constructor', { fg = palette.base05 })

    -- 2. Black: Non-executable meta-text (Comments only)
    vim.api.nvim_set_hl(0, '@comment', { fg = palette.base03 })
    vim.api.nvim_set_hl(0, '@comment.documentation', { fg = palette.base03 })

    -- 3. Red: Critical alerts / High priority / Flow Stoppers
    vim.api.nvim_set_hl(0, '@keyword.return', { fg = palette.base08 })
    vim.api.nvim_set_hl(0, '@keyword.exception', { fg = palette.base08 })
    vim.api.nvim_set_hl(0, '@exception', { fg = palette.base08 })

    -- 4. Yellow: Attention / Mid-priority / Logic Mid-states
    vim.api.nvim_set_hl(0, '@keyword.conditional', { fg = palette.base0A })
    vim.api.nvim_set_hl(0, '@keyword.repeat', { fg = palette.base0A })
    vim.api.nvim_set_hl(0, '@keyword.import', { fg = palette.base0A })

    -- 5. Cyan: Ephemeral neutral info / Active focus
    vim.api.nvim_set_hl(0, '@function', { fg = palette.base0C })
    vim.api.nvim_set_hl(0, '@function.call', { fg = palette.base0C })
    vim.api.nvim_set_hl(0, '@parameter', { fg = palette.base0C })

    -- 6. Blue: Static neutral information / Non-ephemeral
    vim.api.nvim_set_hl(0, '@type', { fg = palette.base0D })
    vim.api.nvim_set_hl(0, '@type.builtin', { fg = palette.base0D })
    vim.api.nvim_set_hl(0, '@constant', { fg = palette.base0D })
    vim.api.nvim_set_hl(0, '@constant.builtin', { fg = palette.base0D })

    -- 7. Green: Healthy states / Instantiated Data
    vim.api.nvim_set_hl(0, '@string', { fg = palette.base0B })
    vim.api.nvim_set_hl(0, '@number', { fg = palette.base0B })
    vim.api.nvim_set_hl(0, '@boolean', { fg = palette.base0B })

    -- 8. Magenta: Extra / Wildcard
    vim.api.nvim_set_hl(0, '@attribute', { fg = palette.base0E })
    vim.api.nvim_set_hl(0, '@string.regexp', { fg = palette.base0E })
    vim.api.nvim_set_hl(0, '@string.escape', { fg = palette.base0E })

    -- UI OVERRIDES
    -- Covenant Native Dashboard
    vim.api.nvim_set_hl(0, 'CovenantDashboardVerse', { fg = palette.base08, bold = true }) -- Red (Critical)
    vim.api.nvim_set_hl(0, 'CovenantDashboardTitle', { fg = palette.base0D, bold = true }) -- Blue (Neutral label)
    vim.api.nvim_set_hl(0, 'CovenantDashboardSeparator', { fg = palette.base0E }) -- Magenta (Struct)
    vim.api.nvim_set_hl(0, 'CovenantDashboardPath', { fg = palette.base05 }) -- White (Standard file)

    -- Diagnostics & Git
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = palette.base08 })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = palette.base0A })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = palette.base0D })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = palette.base0C })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = palette.base0A, bg = palette.base01 })
    vim.api.nvim_set_hl(0, 'MiniDiffSignChange', { fg = palette.base0A, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = palette.base0C, bg = 'NONE' })

    -- Mason
    vim.api.nvim_set_hl(0, 'MasonHeader', { fg = palette.base00, bg = palette.base0C })
    vim.api.nvim_set_hl(0, 'MasonHighlight', { fg = palette.base0B })
    vim.api.nvim_set_hl(0, 'MasonHighlightBlock', { fg = palette.base00, bg = palette.base0C })
    vim.api.nvim_set_hl(0, 'MasonHighlightBlockBold', { fg = palette.base00, bg = palette.base0C, bold = true })
    vim.api.nvim_set_hl(0, 'MasonMuted', { fg = palette.base03 })
    vim.api.nvim_set_hl(0, 'MasonMutedBlock', { fg = palette.base03, bg = palette.base01 })
    vim.api.nvim_set_hl(0, 'MasonWarning', { fg = palette.base0B })

    -- Native Borders
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = palette.base0C, bg = 'NONE' })
    vim.diagnostic.config { float = { border = 'single' } }
    vim.o.winborder = 'single'

    -- Statusline Modes (Strictly variant_3 to reserve variant_1 for code)
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = '#0C0C0C', bg = '#9C8C78', bold = true }) -- broken_bread_3
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = '#0C0C0C', bg = '#AC862F', bold = true }) -- royal_sash_3
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = '#0C0C0C', bg = '#3A8273', bold = true }) -- water_of_life_3
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = '#0C0C0C', bg = '#8B2F35', bold = true }) -- poured_wine_3
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther', { fg = '#0C0C0C', bg = '#6F3957', bold = true }) -- thorned_veil_3 (Fallback)
  end,
}
