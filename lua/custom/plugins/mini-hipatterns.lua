return {
  'nvim-mini/mini.hipatterns',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    local hipatterns = require 'mini.hipatterns'

    -- Calculates whether the text should be light or dark based on background luminance
    local get_fg = function(hex)
      local r = tonumber(hex:sub(2, 3), 16)
      local g = tonumber(hex:sub(4, 5), 16)
      local b = tonumber(hex:sub(6, 7), 16)
      -- Standard relative luminance math
      return (0.299 * r + 0.587 * g + 0.114 * b) > 128 and '#0C0C0C' or '#F0EBE1'
    end

    -- RGB/RGBA Parser (Extracts the first 3 numbers, ignores the alpha if present)
    local compute_rgb = function(_, match)
      local r, g, b = match:match 'rgba?%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)'
      if not r then return nil end

      r, g, b = math.min(tonumber(r), 255), math.min(tonumber(g), 255), math.min(tonumber(b), 255)
      local hex = string.format('#%02x%02x%02x', r, g, b)
      local group = 'MiniHipatternsRGB_' .. hex:sub(2)

      vim.api.nvim_set_hl(0, group, { bg = hex, fg = get_fg(hex) })
      return group
    end

    -- HSL/HSLA Parser (Extracts Hue, Sat %, Light %, converts to RGB, then to Hex)
    local compute_hsl = function(_, match)
      local h, s, l = match:match 'hsla?%(%s*(%d+)%s*,%s*(%d+)%%%s*,%s*(%d+)%%'
      if not h then return nil end

      h = tonumber(h) % 360
      s = math.min(math.max(tonumber(s), 0), 100) / 100
      l = math.min(math.max(tonumber(l), 0), 100) / 100

      local c = (1 - math.abs(2 * l - 1)) * s
      local x = c * (1 - math.abs((h / 60) % 2 - 1))
      local m = l - c / 2

      local r, g, b = 0, 0, 0
      if h < 60 then
        r, g, b = c, x, 0
      elseif h < 120 then
        r, g, b = x, c, 0
      elseif h < 180 then
        r, g, b = 0, c, x
      elseif h < 240 then
        r, g, b = 0, x, c
      elseif h < 300 then
        r, g, b = x, 0, c
      else
        r, g, b = c, 0, x
      end

      local R = math.floor((r + m) * 255 + 0.5)
      local G = math.floor((g + m) * 255 + 0.5)
      local B = math.floor((b + m) * 255 + 0.5)

      local hex = string.format('#%02x%02x%02x', R, G, B)
      local group = 'MiniHipatternsHSL_' .. hex:sub(2)

      vim.api.nvim_set_hl(0, group, { bg = hex, fg = get_fg(hex) })
      return group
    end

    return {
      highlighters = {
        -- Native Hex
        hex_color = hipatterns.gen_highlighter.hex_color(),

        -- Custom RGB and HSL engines
        rgb_color = { pattern = 'rgba?%(%s*%d+%s*,%s*%d+%s*,%s*%d+[^%)]*%)', group = compute_rgb },
        hsl_color = { pattern = 'hsla?%(%s*%d+%s*,%s*%d+%%%s*,%s*%d+%%[^%)]*%)', group = compute_hsl },

        -- Covenant TODO Comments (Replaces todo-comments.nvim)
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
      },
    }
  end,
  config = function(_, opts)
    -- Crucial: Enable True Color or none of this math matters
    vim.opt.termguicolors = true

    -- Enforce Covenant Base16 colors for your semantic tags
    vim.api.nvim_set_hl(0, 'MiniHipatternsFixme', { fg = '#0C0C0C', bg = '#B83E46', bold = true }) -- Red
    vim.api.nvim_set_hl(0, 'MiniHipatternsHack', { fg = '#0C0C0C', bg = '#DCAE3D', bold = true }) -- Yellow
    vim.api.nvim_set_hl(0, 'MiniHipatternsTodo', { fg = '#0C0C0C', bg = '#4AA893', bold = true }) -- Cyan
    vim.api.nvim_set_hl(0, 'MiniHipatternsNote', { fg = '#0C0C0C', bg = '#6C9FBF', bold = true }) -- Blue

    require('mini.hipatterns').setup(opts)
  end,
}
