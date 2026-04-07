-- lua/config/theme.lua
-- Enforces the 8-Color Execution Risk Hierarchy.
-- UI is strictly monochromatic. Code is colored by runtime topography.

local function apply_cromanomy()
  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end
  vim.g.colors_name = 'cromanomy'

  local p = {
    bg_main = '#1e1e1e',
    bg_sub = '#363636',
    black = '#9e9e9e',
    red = '#F34E4E',
    yellow = '#cfcf2a',
    green = '#36db36',
    blue = '#7e7eff',
    magenta = '#e742e7',
    cyan = '#38d5d5',
    white = '#dbdbdb',
  }

  local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

  -- ==========================================
  -- UI CORE: STRICTLY MONOCHROMATIC
  -- ==========================================
  hi('Normal', { fg = p.white, bg = p.bg_main })
  hi('NormalFloat', { fg = p.black, bg = p.bg_sub })
  hi('NormalNC', { fg = p.white, bg = p.bg_main })
  hi('ColorColumn', { bg = p.bg_sub })
  hi('CursorColumn', { bg = p.bg_sub })
  hi('CursorLine', { bg = p.bg_sub })
  hi('CursorLineNr', { fg = p.black, bg = p.bg_sub, bold = true })
  hi('LineNr', { fg = p.black, bg = p.bg_main })
  hi('SignColumn', { fg = p.black, bg = p.bg_main })
  hi('VertSplit', { fg = p.bg_sub, bg = p.bg_main })
  hi('WinSeparator', { fg = p.bg_sub, bg = p.bg_main })
  hi('EndOfBuffer', { fg = p.bg_main, bg = p.bg_main })
  hi('FloatBorder', { fg = p.black, bg = p.bg_sub })
  hi('FloatTitle', { fg = p.black, bg = p.bg_sub, bold = true })
  hi('Pmenu', { fg = p.black, bg = p.bg_sub })
  hi('PmenuSel', { fg = p.bg_main, bg = p.black, bold = true })
  hi('PmenuSbar', { bg = p.bg_sub })
  hi('PmenuThumb', { bg = p.black })
  hi('StatusLine', { fg = p.black, bg = p.bg_sub })
  hi('StatusLineNC', { fg = p.black, bg = p.bg_main })
  hi('TabLine', { fg = p.black, bg = p.bg_sub })
  hi('TabLineFill', { fg = p.black, bg = p.bg_main })
  hi('TabLineSel', { fg = p.black, bg = p.bg_main, bold = true })
  hi('Title', { fg = p.black, bold = true })
  hi('Visual', { bg = p.bg_sub })
  hi('Search', { fg = p.bg_main, bg = p.black })
  hi('IncSearch', { fg = p.bg_main, bg = p.black })
  hi('MatchParen', { fg = p.bg_main, bg = p.black, bold = true })
  hi('NonText', { fg = p.black })
  hi('Whitespace', { fg = p.bg_sub })
  hi('Directory', { fg = p.black, bold = true })
  hi('Conceal', { fg = p.black })
  hi('MsgArea', { fg = p.black, bg = p.bg_main })
  hi('MoreMsg', { fg = p.black, bold = true })
  hi('ModeMsg', { fg = p.black, bold = true })

  -- ==========================================
  -- DIAGNOSTICS & VCS (UI = Black, Code = Colored)
  -- ==========================================
  -- Virtual text and signs remain monochromatic UI elements.
  hi('DiagnosticError', { fg = p.black, bg = p.bg_main })
  hi('DiagnosticWarn', { fg = p.black, bg = p.bg_main })
  hi('DiagnosticInfo', { fg = p.black, bg = p.bg_main })
  hi('DiagnosticHint', { fg = p.black, bg = p.bg_main })
  hi('DiagnosticVirtualTextError', { fg = p.black, bg = p.bg_sub })
  hi('DiagnosticVirtualTextWarn', { fg = p.black, bg = p.bg_sub })
  hi('DiagnosticVirtualTextInfo', { fg = p.black, bg = p.bg_sub })
  hi('DiagnosticVirtualTextHint', { fg = p.black, bg = p.bg_sub })

  -- Underlines highlight the actual code, so they get the semantic accent.
  hi('DiagnosticUnderlineError', { sp = p.red, undercurl = true })
  hi('DiagnosticUnderlineWarn', { sp = p.yellow, undercurl = true })
  hi('DiagnosticUnderlineInfo', { sp = p.cyan, undercurl = true })
  hi('DiagnosticUnderlineHint', { sp = p.black, undercurl = true })

  hi('DiffAdd', { fg = p.black, bg = p.bg_sub })
  hi('DiffChange', { fg = p.black, bg = p.bg_sub })
  hi('DiffDelete', { fg = p.black, bg = p.bg_sub })
  hi('DiffText', { fg = p.bg_main, bg = p.black })

  -- ==========================================
  -- STANDARD SYNTAX FALLBACKS
  -- ==========================================
  hi('Comment', { fg = p.black, italic = true })
  hi('SpecialComment', { fg = p.black, italic = true })
  hi('String', { fg = p.white })
  hi('Character', { fg = p.white })
  hi('Number', { fg = p.white })
  hi('Float', { fg = p.white })
  hi('Boolean', { fg = p.magenta })
  hi('Constant', { fg = p.magenta })
  hi('Identifier', { fg = p.cyan })
  hi('Function', { fg = p.blue })
  hi('Statement', { fg = p.white })
  hi('Conditional', { fg = p.yellow })
  hi('Repeat', { fg = p.yellow })
  hi('Label', { fg = p.blue })
  hi('Operator', { fg = p.white })
  hi('Keyword', { fg = p.white })
  hi('Exception', { fg = p.red })
  hi('PreProc', { fg = p.green })
  hi('Include', { fg = p.green })
  hi('Define', { fg = p.blue })
  hi('Macro', { fg = p.green })
  hi('PreCondit', { fg = p.yellow })
  hi('Type', { fg = p.blue })
  hi('StorageClass', { fg = p.blue })
  hi('Structure', { fg = p.blue })
  hi('Typedef', { fg = p.blue })
  hi('Special', { fg = p.white })
  hi('SpecialChar', { fg = p.red })
  hi('Delimiter', { fg = p.white })
  hi('Debug', { fg = p.magenta })
  hi('Error', { fg = p.red, bold = true })
  hi('Todo', { fg = p.yellow, bold = true })

  -- ==========================================
  -- TREESITTER: EXECUTION RISK HIERARCHY
  -- ==========================================

  -- VIM
  -- RED: Vimscript Halts
  -- Targeting 'return' and exceptions specifically from the scm
  hi('@keyword.exception', { fg = p.red })

  -- GREEN: Vimscript Triggers
  -- Most Vim commands are tagged as generic @keyword in this scm.
  -- We must force them to Green.
  hi('@keyword', { fg = p.green })
  hi('@function.macro', { fg = p.green }) -- Catches (command_name)

  -- BLUE: Structural Architecture
  -- In this scm, 'function' and 'endfunction' are @keyword.function
  hi('@keyword.function', { fg = p.blue })
  hi('@module', { fg = p.blue }) -- Catches scopes like 'v:', 'l:', 's:'

  -- WHITE: Inert Baseline
  -- Since we moved @keyword to Green, we must ensure operators and punctuation
  -- stay White so they don't turn into triggers.
  hi('@operator', { fg = p.white })
  hi('@punctuation.bracket', { fg = p.white })
  hi('@punctuation.delimiter', { fg = p.white })

  -- VIMDOC
  -- VIMDOC ARCHITECTURE
  -- Maps structural headings to Blue and active routing to Cyan
  hi('@markup.heading', { fg = p.blue, bold = true }) -- h1, h2, h3 headers
  hi('@label', { fg = p.cyan }) -- *tags* for internal jumping
  hi('@markup.link', { fg = p.cyan }) -- |links| to other help topics
  hi('@variable.parameter', { fg = p.cyan }) -- {arguments} in function signatures

  -- VIMDOC EXECUTION TRIGGERS
  -- Code examples and modelines are treated as active payloads
  hi('@markup.raw', { fg = p.green }) -- `inline code` spans
  hi('@markup.raw.block', { fg = p.green }) -- > indented code blocks
  hi('@keyword.directive', { fg = p.green }) -- vim: modelines

  -- VIMDOC SEMANTIC RISK HIERARCHY
  -- Maps diagnostic notes to their respective risk levels
  hi('@comment.hint', { fg = p.black, italic = true }) -- Note: (Passive context)
  hi('@comment.warning', { fg = p.yellow, bold = true }) -- Warning: (Branching risk)
  hi('@comment.error', { fg = p.red, bold = true }) -- Deprecated: (Execution halt)

  -- INERT CONTEXT
  hi('@string.special.url', { fg = p.black }) -- Recedes raw URLs

  -- RED: Halts, Errors, Hard Stops
  hi('@keyword.return', { fg = p.red })
  hi('@keyword.exception', { fg = p.red })
  hi('@exception', { fg = p.red })
  hi('@error', { fg = p.red, undercurl = true })

  -- YELLOW: Redirections, Branches, Routes
  hi('@keyword.conditional', { fg = p.yellow })
  hi('@keyword.repeat', { fg = p.yellow })
  hi('@character.special', { fg = p.yellow })
  hi('@markup.strong', { fg = p.yellow, bold = true })
  hi('@markup.italic', { fg = p.yellow, italic = true })

  -- GREEN: Triggers, Injections
  hi('@function.call', { fg = p.green })
  hi('@function.method.call', { fg = p.green })
  hi('@function.macro', { fg = p.green })
  hi('@keyword.import', { fg = p.green })
  hi('@keyword.directive', { fg = p.green })
  hi('@function.call', { fg = p.green })
  hi('@function.method.call', { fg = p.green })
  hi('@function.builtin', { fg = p.green })
  hi('@keyword.import', { fg = p.green })
  hi('@function.builtin', { fg = p.green })
  hi('@command', { fg = p.green })
  hi('@command.builtin', { fg = p.green })
  hi('@markup.raw', { fg = p.green })
  hi('@markup.raw.block', { fg = p.green })

  -- BLUE: Structural Architecture
  hi('@function', { fg = p.blue })
  hi('@function.method', { fg = p.blue })
  hi('@type', { fg = p.blue })
  hi('@type.builtin', { fg = p.blue })
  hi('@type.qualifier', { fg = p.blue })
  hi('@type.definition', { fg = p.blue })
  hi('@class', { fg = p.blue })
  hi('@module', { fg = p.blue })
  hi('@keyword.modifier', { fg = p.blue })
  hi('@string.regexp', { fg = p.blue })
  hi('@tag', { fg = p.blue })
  hi('@tag.delimiter', { fg = p.blue })
  hi('@keyword.function', { fg = p.blue }) -- Catches `def` and `function`
  hi('@keyword.coroutine', { fg = p.blue })
  hi('@keyword.local', { fg = p.blue })
  hi('@keyword.declaration', { fg = p.blue })
  hi('@markup.heading', { fg = p.blue, bold = true })
  hi('@markup.list', { fg = p.blue })
  hi('@markup.quote', { fg = p.blue })

  -- MAGENTA: Core Primitives
  hi('@boolean', { fg = p.magenta })
  hi('@constant.builtin', { fg = p.magenta })
  hi('@variable.builtin', { fg = p.magenta })

  -- CYAN: Ephemeral State
  hi('@variable', { fg = p.cyan })
  hi('@variable.parameter', { fg = p.cyan })
  hi('@variable.member', { fg = p.cyan })
  hi('@property', { fg = p.cyan })
  hi('@tag.attribute', { fg = p.cyan })
  hi('@markup.link.label', { fg = p.cyan })

  -- WHITE: Inert Baseline
  hi('@string', { fg = p.white })
  hi('@string.regexp', { fg = p.white })
  hi('@string.escape', { fg = p.white })
  hi('@number', { fg = p.white })
  hi('@float', { fg = p.white })
  hi('@operator', { fg = p.white })
  hi('@punctuation', { fg = p.white })
  hi('@punctuation.bracket', { fg = p.white })
  hi('@punctuation.delimiter', { fg = p.white })
  hi('@symbol', { fg = p.white })
  hi('@string.special.symbol', { fg = p.white })
  hi('@string.special', { fg = p.white })

  -- BLACK: Comments
  hi('@comment', { fg = p.black, italic = true })
  hi('@comment.documentation', { fg = p.black, italic = true })
  hi('@markup.link.url', { fg = p.black, italic = true })

  -- ==========================================
  -- COVENANT DASHBOARD
  -- ==========================================
  hi('CovenantDashboardSeparator', { fg = p.bg_sub }) -- Recedes into background
  hi('CovenantDashboardVerse', { fg = p.black, italic = true }) -- Passive context
  hi('CovenantDashboardTitle', { fg = p.blue, bold = true }) -- Structural headers
  hi('CovenantDashboardPath', { fg = p.cyan }) -- Active ephemeral links

  -- ==========================================
  -- PLUGIN UI OVERRIDES
  -- ==========================================
  -- fidget.nvim
  hi('FidgetTitle', { fg = p.black, bg = p.bg_main, bold = true })
  hi('FidgetTask', { fg = p.bg_sub, bg = p.bg_main })
  -- mini.diff [cite: 58]
  hi('MiniDiffSignAdd', { fg = p.black, bg = p.bg_main })
  hi('MiniDiffSignChange', { fg = p.black, bg = p.bg_main })
  hi('MiniDiffSignDelete', { fg = p.black, bg = p.bg_main })

  -- mini.files [cite: 59]
  hi('MiniFilesNormal', { fg = p.black, bg = p.bg_main })
  hi('MiniFilesBorder', { fg = p.black })
  hi('MiniFilesTitle', { fg = p.black, bold = true })
  hi('MiniFilesTitleFocused', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniFilesCursorLine', { bg = p.bg_sub })

  -- mini.pick [cite: 59]
  hi('MiniPickNormal', { fg = p.black, bg = p.bg_main })
  hi('MiniPickBorder', { fg = p.black })
  hi('MiniPickPrompt', { fg = p.black, bg = p.bg_sub })
  hi('MiniPickMatchCurrent', { bg = p.bg_sub, bold = true })
  hi('MiniPickMatchRanges', { fg = p.black, bold = true })

  -- mini.statusline
  hi('MiniStatuslineModeNormal', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineModeInsert', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineModeVisual', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineModeCommand', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineModeReplace', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineModeOther', { fg = p.bg_main, bg = p.black, bold = true })
  hi('MiniStatuslineDevinfo', { fg = p.black, bg = p.bg_sub })
  hi('MiniStatuslineFilename', { fg = p.black, bg = p.bg_main })

  -- mini.clue
  hi('MiniClueNormal', { fg = p.black, bg = p.bg_sub })
  hi('MiniClueBorder', { fg = p.black, bg = p.bg_sub })
  hi('MiniClueTitle', { fg = p.black, bold = true })
  hi('MiniClueNextKey', { fg = p.black, bold = true })

  -- mini.indentscope
  hi('MiniIndentscopeSymbol', { fg = p.black })
  hi('MiniIndentscopeSymbolOff', { fg = p.bg_sub })

  -- blink.cmp [cite: 56]
  hi('BlinkCmpMenu', { fg = p.black, bg = p.bg_sub })
  hi('BlinkCmpMenuBorder', { fg = p.black, bg = p.bg_sub })
  hi('BlinkCmpMenuSelection', { fg = p.bg_main, bg = p.black, bold = true })
  hi('BlinkCmpLabel', { fg = p.black })
  hi('BlinkCmpLabelMatch', { fg = p.black, bold = true })
  hi('BlinkCmpKind', { fg = p.black })

  -- lazy.nvim [cite: 56] & mason.nvim
  hi('LazyNormal', { fg = p.black, bg = p.bg_main })
  hi('MasonNormal', { fg = p.black, bg = p.bg_main })

  -- nvim-dap [cite: 60] & neotest
  hi('DapBreakpoint', { fg = p.black, bg = p.bg_main })
  hi('DapStopped', { fg = p.bg_main, bg = p.black })
  hi('NeotestPassed', { fg = p.black })
  hi('NeotestFailed', { fg = p.black })

  -- Terminal Colors
  vim.g.terminal_color_0 = p.bg_main
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

apply_cromanomy()
