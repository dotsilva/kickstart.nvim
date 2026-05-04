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
      return (0.299 * r + 0.587 * g + 0.114 * b) > 128 and '#1e1e1e' or '#dbdbdb'
    end

    -- RGB/RGBA Parser (Extracts the first 3 numbers, ignores the alpha if present)
    local compute_rgb = function(_, match)
      local r, g, b = match:match 'rgba?%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)'
      if not r then return nil end

      r = math.min(tonumber(r), 255)
      g = math.min(tonumber(g), 255)
      b = math.min(tonumber(b), 255)

      local hex = string.format('#%02x%02x%02x', r, g, b)
      return require('mini.hipatterns').compute_hex_color_group(hex, 'bg')
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
      return require('mini.hipatterns').compute_hex_color_group(hex, 'bg')
    end

    return {
      highlighters = {
        -- Native Hex
        hex_color = hipatterns.gen_highlighter.hex_color(),

        -- Custom RGB and HSL engines
        rgb_color = { pattern = 'rgba?%(%s*%d+%s*,%s*%d+%s*,%s*%d+[^%)]*%)', group = compute_rgb },
        hsl_color = { pattern = 'hsla?%(%s*%d+%s*,%s*%d+%%%s*,%s*%d+%%[^%)]*%)', group = compute_hsl },

        --  TODO Comments (Replaces todo-comments.nvim)
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

    -- Enforce colors for your semantic tags
    vim.api.nvim_set_hl(0, 'MiniHipatternsFix', { fg = '#1E1E1E', bg = '#F34E4E', bold = true }) -- Red
    vim.api.nvim_set_hl(0, 'MiniHipatternsHack', { fg = '#1E1E1E', bg = '#cfcf2a', bold = true }) -- Yellow
    vim.api.nvim_set_hl(0, 'MiniHipatternsTodo', { fg = '#1E1E1E', bg = '#38d5d5', bold = true }) -- Cyan

    require('mini.hipatterns').setup(opts)
  end,
}
