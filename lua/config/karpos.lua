vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end
vim.g.colors_name = 'karpos'
vim.o.background = 'dark'

-- color palette
local p = {
  bg0 = '#1E1E1E',
  bg1 = '#2A2A2A',
  black = '#919191',
  red = '#F34E4E',
  green = '#36DB36',
  yellow = '#CFCF2A',
  blue = '#7E7EFF',
  magenta = '#E742E7',
  cyan = '#38D5D5',
  white = '#D2D2D2',
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- ==========================================
-- PHASE A: TERMINAL VARIABLES
-- ==========================================
vim.g.terminal_color_0 = p.black
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

-- ==========================================
-- PHASE B: UI BACKGROUNDS & BORDERS
-- ==========================================
-- Base Text & Backgrounds
hi('Normal', { fg = p.black, bg = p.bg0 })
hi('NormalFloat', { fg = p.black, bg = p.bg1 })
hi('NormalNC', { fg = p.black, bg = p.bg0 })
hi('ColorColumn', { bg = p.bg1 })
hi('CursorColumn', { bg = p.bg1 })
hi('CursorLine', { bg = 'NONE', underdouble = true, sp = p.black })
hi('CursorLineNr', { fg = p.black, bg = p.bg1, underdouble = true })
hi('LineNr', { fg = p.black, bg = p.bg1 })
hi('SignColumn', { fg = p.black, bg = p.bg1 })
hi('FoldColumn', { fg = p.black, bg = p.bg1 })
hi('VertSplit', { fg = p.bg1, bg = p.bg0 })
hi('WinSeparator', { fg = p.bg1, bg = p.bg0 })
hi('EndOfBuffer', { fg = p.bg0, bg = p.bg0 })
hi('Pmenu', { fg = p.black, bg = p.bg1 })
hi('PmenuSel', { fg = p.bg1, bg = p.cyan, bold = true })
hi('PmenuSbar', { bg = p.bg0 })
hi('PmenuThumb', { bg = p.black })
hi('StatusLine', { fg = p.black, bg = p.bg1, bold = true })
hi('StatusLineNC', { fg = p.black, bg = p.bg0 })
hi('TabLine', { fg = p.black, bg = p.bg1 })
hi('TabLineFill', { fg = p.black, bg = p.bg0 })
hi('TabLineSel', { fg = p.black, bg = p.bg0, bold = true })
hi('Title', { fg = p.black, bold = true })
hi('Visual', { bg = p.bg1 })
hi('Search', { fg = p.bg0, bg = p.magenta })
hi('IncSearch', { fg = p.bg0, bg = p.magenta })
hi('MatchParen', { fg = p.bg0, bg = p.black, bold = true })
hi('Directory', { fg = p.black, bold = true })
hi('MsgArea', { fg = p.black, bg = p.bg0 })

-- Confirmations, Warnings, and Prompts
hi('Question', { fg = p.yellow, bold = true })
hi('WarningMsg', { fg = p.yellow, bold = true })
hi('MoreMsg', { fg = p.yellow, bold = true })
hi('ErrorMsg', { fg = p.red, bold = true, bg = p.bg1 })

-- Strict Blue Borders
hi('FloatBorder', { fg = p.blue, bg = p.bg1 })
hi('FloatTitle', { fg = p.black, bg = p.bg1, bold = true })

-- ==========================================
-- PHASE C: DIAGNOSTICS & VCS
-- ==========================================
-- Diagnostics Text
hi('DiagnosticError', { fg = p.red, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticWarn', { fg = p.yellow, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticInfo', { fg = p.black, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticHint', { fg = p.black, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticVirtualTextError', { fg = p.red, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticVirtualTextWarn', { fg = p.yellow, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticVirtualTextInfo', { fg = p.black, bg = p.bg1, bold = true, italic = true })
hi('DiagnosticVirtualTextHint', { fg = p.black, bg = p.bg1, bold = true, italic = true })

-- Diagnostics
hi('DiagnosticUnderlineError', { sp = p.red, undercurl = true })
hi('DiagnosticUnderlineWarn', { sp = p.yellow, undercurl = true })
hi('DiagnosticUnderlineInfo', { sp = p.black, undercurl = true })
hi('DiagnosticUnderlineHint', { sp = p.black, undercurl = true })
hi('DiagnosticUnnecessary', { sp = p.black, undercurl = true })

-- Diff States
hi('DiffAdd', { fg = p.green, bg = p.bg0, bold = true, italic = true })
hi('DiffChange', { fg = p.yellow, bg = p.bg0, bold = true, italic = true })
hi('DiffDelete', { fg = p.red, bg = p.bg0, bold = true, italic = true })
hi('DiffText', { fg = p.bg0, bg = p.yellow, bold = true, italic = true })

-- ==========================================
-- PHASE D: TREESITTER
-- ==========================================
-- green - working
hi('@function.call', { fg = p.green })
hi('@method.call', { fg = p.green })
hi('@operator', { fg = p.green })

-- cyan referencing
hi('@variable', { fg = p.cyan })
hi('@variable.parameter', { fg = p.cyan })
hi('@variable.member', { fg = p.cyan })
hi('@property', { fg = p.cyan })
hi('@module', { fg = p.cyan })

-- blue - defining
hi('@function', { fg = p.blue })
hi('@method', { fg = p.blue })
hi('@type', { fg = p.blue })
hi('@type.builtin', { fg = p.blue })
hi('@keyword.function', { fg = p.blue })
hi('@keyword.return', { fg = p.red })
hi('@punctuation.bracket', { fg = p.blue })
hi('@punctuation.delimiter', { fg = p.blue })

-- yellow - routing
hi('@keyword.conditional', { fg = p.yellow })
hi('@keyword.repeat', { fg = p.yellow })
hi('@keyword.exception', { fg = p.yellow })

-- magenta - signaling
hi('@boolean', { fg = p.magenta })
hi('@constant.builtin', { fg = p.magenta })
hi('@character.special', { fg = p.magenta })
hi('@string.escape', { fg = p.magenta })

-- white - saying
hi('@string', { fg = p.white })
hi('@number', { fg = p.white })
hi('@float', { fg = p.white })
hi('@character', { fg = p.white })

-- red - stopping
hi('@keyword.directive', { fg = p.red })

-- black - commenting
hi('@comment', { fg = p.black, italic = true })
hi('@comment.documentation', { fg = p.black, bold = true, italic = true })
hi('@spell', { fg = p.black, italic = true })

-- ==========================================
-- PHASE E: LEGACY SYNTAX FALLBACKS
-- ==========================================
hi('Comment', { fg = p.black, italic = true })
hi('String', { fg = p.white })
hi('Number', { fg = p.white })
hi('Boolean', { fg = p.magenta })
hi('Constant', { fg = p.magenta })
hi('Identifier', { fg = p.cyan })
hi('Function', { fg = p.green })
hi('Statement', { fg = p.blue })
hi('Conditional', { fg = p.yellow })
hi('Repeat', { fg = p.yellow })
hi('Operator', { fg = p.green })
hi('Keyword', { fg = p.blue })
hi('Exception', { fg = p.yellow })
hi('PreProc', { fg = p.red })
hi('Type', { fg = p.blue })
hi('Special', { fg = p.magenta })
hi('Delimiter', { fg = p.blue })
hi('Error', { fg = p.red, bold = true })
hi('Todo', { fg = p.cyan, bold = true })

-- ==========================================
-- PHASE F: PLUGINS
-- ==========================================
hi('CovenantDashboardSeparator', { fg = p.bg1 })
hi('CovenantDashboardVerse', { fg = p.black, bold = true })
hi('CovenantDashboardTitle', { fg = p.blue, bold = true })
hi('CovenantDashboardPath', { fg = p.cyan })

hi('FidgetTitle', { fg = p.blue, bg = p.bg0, bold = true })
hi('FidgetTask', { fg = p.black, bg = p.bg0 })

-- Mini Diff
hi('MiniDiffSignAdd', { fg = p.green, bg = p.bg1 })
hi('MiniDiffSignChange', { fg = p.yellow, bg = p.bg1 })
hi('MiniDiffSignDelete', { fg = p.red, bg = p.bg1 })

-- Mini Files (Strict Blue Borders)
hi('MiniFilesNormal', { fg = p.black, bg = p.bg1 })
hi('MiniFilesBorder', { fg = p.blue })
hi('MiniFilesTitle', { fg = p.black, bg = p.bg1, bold = true })
hi('MiniFilesTitleFocused', { fg = p.bg0, bg = p.cyan, bold = true })
hi('MiniFilesCursorLine', { bg = 'NONE', underdouble = true, sp = p.black })

-- Mini Pick (Strict Blue Borders)
hi('MiniPickNormal', { fg = p.black, bg = p.bg1 })
hi('MiniPickBorder', { fg = p.blue })
hi('MiniPickPrompt', { fg = p.black, bg = p.bg1 })
hi('MiniPickMatchCurrent', { bg = 'NONE', underdouble = true, sp = p.black })
hi('MiniPickMatchRanges', { fg = p.cyan, bold = true })

-- Mini Statusline
hi('MiniStatuslineModeNormal', { fg = p.bg0, bg = p.black, bold = true, italic = true })
hi('MiniStatuslineModeInsert', { fg = p.bg0, bg = p.white, bold = true, italic = true })
hi('MiniStatuslineModeVisual', { fg = p.bg0, bg = p.cyan, bold = true, italic = true })
hi('MiniStatuslineModeCommand', { fg = p.bg0, bg = p.green, bold = true, italic = true })
hi('MiniStatuslineModeReplace', { fg = p.bg0, bg = p.magenta, bold = true, italic = true })
hi('MiniStatuslineModeOther', { fg = p.bg0, bg = p.black, bold = true, italic = true })
hi('MiniStatuslineDevinfo', { fg = p.black, bg = p.bg1 })
hi('MiniStatuslineFilename', { fg = p.black, bg = p.bg1 })

-- Mini Clue (Strict Blue Borders)
hi('MiniClueNormal', { fg = p.black, bg = p.bg1 })
hi('MiniClueBorder', { fg = p.blue, bg = p.bg1 })
hi('MiniClueTitle', { fg = p.blue })
hi('MiniClueNextKey', { fg = p.black })

-- Mini Indentscope
hi('MiniIndentscopeSymbol', { fg = p.black })
hi('MiniIndentscopeSymbolOff', { fg = p.bg0 })

-- Blink CMP (Strict Blue Borders)
hi('BlinkCmpMenu', { fg = p.black, bg = p.bg1 })
hi('BlinkCmpMenuBorder', { fg = p.blue, bg = p.bg1 })
hi('BlinkCmpMenuSelection', { fg = p.bg0, bg = p.cyan })
hi('BlinkCmpLabel', { fg = p.black })
hi('BlinkCmpLabelMatch', { fg = p.magenta, bold = true })
hi('BlinkCmpKind', { fg = p.cyan })
hi('BlinkCmpDocBorder', { fg = p.blue, bg = p.bg1 })
hi('BlinkCmpSignatureHelpBorder', { fg = p.blue, bg = p.bg1 })

-- Lazy & Mason
hi('LazyNormal', { fg = p.black, bg = p.bg1 })
hi('MasonNormal', { fg = p.black, bg = p.bg1 })

-- DAP & Neotest
hi('DapBreakpoint', { fg = p.red, bg = p.bg1 })
hi('DapStopped', { fg = p.yellow, bg = p.bg1 })
hi('NeotestPassed', { fg = p.green })
hi('NeotestFailed', { fg = p.red })
