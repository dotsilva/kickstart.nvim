-- For of Him, and through Him, and unto Him, are all things.
-- To Him be the glory for ever. Amen. - Romans 11:36 ASV 1901

-- 1. Leader keys MUST be set before anything else, or plugins bind to the wrong key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 2. Load the foundational layer (Priority logic and UI)
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.dashboard'
require 'config.health'
require 'config.chromanomy'

-- 3. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end
vim.opt.rtp:prepend(lazypath)

-- 4. Execute the package manager
require('lazy').setup({
  -- Automatically sweep and load everything in lua/custom/plugins/
  { import = 'plugins' },
}, {
  ui = {
    border = 'single',
    -- Evaluates vim.g.have_nerd_font (which you will define in config.options)
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
