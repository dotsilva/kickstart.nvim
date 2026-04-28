local function apply_chromanomy()
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end
  vim.g.colors_name = 'chromanomy'

  local p = {
    -- deeper/main background
    bg0 = '#1E1E1E',
    -- secondary background, to do things stand over, like the status line, signcolumn a plugin pop-up
    bg1 = '#2A2A2A',
    -- for comments as defined in chromanomy README.md and any other text/icon/glyph that is not part of the actual edited file
    black = '#919191',
    red = '#F34E4E',
    yellow = '#CFCF2A',
    green = '#36DB36',
    blue = '#7E7EFF',
    magenta = '#E742E7',
    cyan = '#38D5D5',
    white = '#E2E2E2',
  }

  local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

  -- ==========================================
  -- UI CORE: STRICTLY MONOCHROMATIC
  -- ==========================================
  hi('Normal', { fg = p.white, bg = p.bg0 })
  hi('NormalFloat', { fg = p.black, bg = p.bg0 })
  hi('NormalNC', { fg = p.white, bg = p.bg0 })
  hi('ColorColumn', { bg = p.bg0 })
  hi('CursorColumn', { bg = p.bg0 })
  hi('CursorLine', { bg = p.bg0 })
  hi('CursorLineNr', { fg = p.black, bg = p.bg0, bold = true })
  hi('LineNr', { fg = p.black, bg = p.bg0 })
  hi('SignColumn', { fg = p.black, bg = p.bg1 })
  hi('VertSplit', { fg = p.bg0, bg = p.bg0 })
  hi('WinSeparator', { fg = p.bg0, bg = p.bg0 })
  hi('EndOfBuffer', { fg = p.bg0, bg = p.bg0 })
  hi('FloatBorder', { fg = p.black, bg = p.bg0 })
  hi('FloatTitle', { fg = p.black, bg = p.bg0, bold = true })
  hi('Pmenu', { fg = p.black, bg = p.bg0 })
  hi('PmenuSel', { fg = p.bg0, bg = p.black, bold = true })
  hi('PmenuSbar', { bg = p.bg0 })
  hi('PmenuThumb', { bg = p.black })
  hi('StatusLine', { fg = p.black, bg = p.bg1 })
  hi('StatusLineNC', { fg = p.black, bg = p.bg1 })
  hi('TabLine', { fg = p.black, bg = p.bg0 })
  hi('TabLineFill', { fg = p.black, bg = p.bg0 })
  hi('TabLineSel', { fg = p.black, bg = p.bg0, bold = true })
  hi('Title', { fg = p.black, bold = true })
  hi('Visual', { bg = p.bg0 })
  hi('Search', { fg = p.bg0, bg = p.black })
  hi('IncSearch', { fg = p.bg0, bg = p.black })
  hi('MatchParen', { fg = p.bg0, bg = p.black, bold = true })
  hi('NonText', { fg = p.black })
  hi('Whitespace', { fg = p.bg0 })
  hi('Directory', { fg = p.black, bold = true })
  hi('Conceal', { fg = p.black })
  hi('MsgArea', { fg = p.black, bg = p.bg0 })
  hi('MoreMsg', { fg = p.black, bold = true })
  hi('ModeMsg', { fg = p.black, bold = true })

  -- ==========================================
  -- DIAGNOSTICS & VCS
  -- ==========================================
  hi('DiagnosticError', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticWarn', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticInfo', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticHint', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticVirtualTextError', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticVirtualTextWarn', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticVirtualTextInfo', { fg = p.black, bg = p.bg0 })
  hi('DiagnosticVirtualTextHint', { fg = p.black, bg = p.bg0 })

  hi('DiagnosticUnderlineError', { sp = p.red, undercurl = true })
  hi('DiagnosticUnderlineWarn', { sp = p.yellow, undercurl = true })
  hi('DiagnosticUnderlineInfo', { sp = p.cyan, undercurl = true })
  hi('DiagnosticUnderlineHint', { sp = p.black, undercurl = true })
  hi('DiagnosticUnnecessary', { sp = p.yellow, undercurl = true })

  hi('DiffAdd', { fg = p.black, bg = p.bg0 })
  hi('DiffChange', { fg = p.black, bg = p.bg0 })
  hi('DiffDelete', { fg = p.black, bg = p.bg0 })
  hi('DiffText', { fg = p.bg0, bg = p.black })

  -- ==========================================
  -- CHROMANOMY CUSTOM CAPTURES
  -- ==========================================
  hi('@cn.bg0', { bg = p.bg0 })
  hi('@cn.bg0', { bg = p.bg0 })
  hi('@cn.bg0', { bg = p.bg0 })
  hi('@cn.bg0', { bg = p.bg0 })
  hi('@cn.comment', { fg = p.black, italic = true })
  hi('@cn.stop', { fg = p.red })
  hi('@cn.work', { fg = p.green })
  hi('@cn.route', { fg = p.yellow })
  hi('@cn.define', { fg = p.blue })
  hi('@cn.signal', { fg = p.magenta })
  hi('@cn.reference', { fg = p.cyan })
  hi('@cn.say', { fg = p.white })

  -- ==========================================
  -- STANDARD SYNTAX FALLBACKS
  -- ==========================================
  hi('Comment', { fg = p.black, italic = true })
  hi('String', { fg = p.white })
  hi('Character', { fg = p.white })
  hi('Number', { fg = p.white })
  hi('Float', { fg = p.white })
  hi('Boolean', { fg = p.magenta })
  hi('Constant', { fg = p.blue })
  hi('Identifier', { fg = p.cyan })
  hi('Function', { fg = p.green })
  hi('Statement', { fg = p.blue })
  hi('Conditional', { fg = p.yellow })
  hi('Repeat', { fg = p.yellow })
  hi('Label', { fg = p.cyan })
  hi('Operator', { fg = p.white })
  hi('Keyword', { fg = p.blue })
  hi('Exception', { fg = p.red })
  hi('PreProc', { fg = p.magenta })
  hi('Type', { fg = p.blue })
  hi('Special', { fg = p.magenta })
  hi('Delimiter', { fg = p.blue })
  hi('Error', { fg = p.red, bold = true })
  hi('Todo', { fg = p.cyan, bold = true })

  -- ==========================================
  -- PLUGIN UI OVERRIDES
  -- ==========================================
  hi('CovenantDashboardSeparator', { fg = p.bg0 })
  hi('CovenantDashboardVerse', { fg = p.black, italic = true })
  hi('CovenantDashboardTitle', { fg = p.blue, bold = true })
  hi('CovenantDashboardPath', { fg = p.cyan })

  hi('FidgetTitle', { fg = p.black, bg = p.bg0, bold = true })
  hi('FidgetTask', { fg = p.bg0, bg = p.bg0 })

  hi('MiniDiffSignAdd', { fg = p.black, bg = p.bg0 })
  hi('MiniDiffSignChange', { fg = p.black, bg = p.bg0 })
  hi('MiniDiffSignDelete', { fg = p.black, bg = p.bg0 })

  hi('MiniFilesNormal', { fg = p.black, bg = p.bg0 })
  hi('MiniFilesBorder', { fg = p.black })
  hi('MiniFilesTitle', { fg = p.black, bold = true })
  hi('MiniFilesTitleFocused', { fg = p.bg0, bg = p.black, bold = true })
  hi('MiniFilesCursorLine', { bg = p.bg0 })

  hi('MiniPickNormal', { fg = p.black, bg = p.bg0 })
  hi('MiniPickBorder', { fg = p.black })
  hi('MiniPickPrompt', { fg = p.black, bg = p.bg0 })
  hi('MiniPickMatchCurrent', { bg = p.bg0, bold = true })
  hi('MiniPickMatchRanges', { fg = p.black, bold = true })

  hi('MiniStatuslineModeNormal', { fg = p.bg0, bg = p.black, bold = true })
  hi('MiniStatuslineModeInsert', { fg = p.bg0, bg = p.white, bold = true })
  hi('MiniStatuslineModeVisual', { fg = p.bg0, bg = p.blue, bold = true })
  hi('MiniStatuslineModeCommand', { fg = p.bg0, bg = p.green, bold = true })
  hi('MiniStatuslineModeReplace', { fg = p.bg0, bg = p.magenta, bold = true })
  hi('MiniStatuslineModeOther', { fg = p.bg0, bg = p.black, bold = true })
  hi('MiniStatuslineDevinfo', { fg = p.black, bg = p.bg1 })
  hi('MiniStatuslineFilename', { fg = p.black, bg = p.bg1 })

  hi('MiniClueNormal', { fg = p.black, bg = p.bg0 })
  hi('MiniClueBorder', { fg = p.black, bg = p.bg0 })
  hi('MiniClueTitle', { fg = p.black, bold = true })
  hi('MiniClueNextKey', { fg = p.black, bold = true })

  hi('MiniIndentscopeSymbol', { fg = p.black })
  hi('MiniIndentscopeSymbolOff', { fg = p.bg0 })

  hi('BlinkCmpMenu', { fg = p.black, bg = p.bg0 })
  hi('BlinkCmpMenuBorder', { fg = p.black, bg = p.bg0 })
  hi('BlinkCmpMenuSelection', { fg = p.bg1, bg = p.black, bold = true })
  hi('BlinkCmpLabel', { fg = p.black })
  hi('BlinkCmpLabelMatch', { fg = p.black, bold = true })
  hi('BlinkCmpKind', { fg = p.black })

  hi('LazyNormal', { fg = p.black, bg = p.bg0 })
  hi('MasonNormal', { fg = p.black, bg = p.bg0 })

  hi('DapBreakpoint', { fg = p.black, bg = p.bg0 })
  hi('DapStopped', { fg = p.bg0, bg = p.black })
  hi('NeotestPassed', { fg = p.black })
  hi('NeotestFailed', { fg = p.black })

  -- Terminal Colors
  vim.g.terminal_color_0 = p.bg0
  vim.g.terminal_color_1 = p.red
  vim.g.terminal_color_2 = p.green
  vim.g.terminal_color_3 = p.yellow
  vim.g.terminal_color_4 = p.blue
  vim.g.terminal_color_5 = p.magenta
  vim.g.terminal_color_6 = p.cyan
  vim.g.terminal_color_7 = p.white
  vim.g.terminal_color_8 = p.black
  vim.g.terminal_color_9 = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.magenta
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.white
end

apply_chromanomy()
