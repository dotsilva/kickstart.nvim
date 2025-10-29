-- ~/.config/nvim-kickstart/ftdetect/conf.lua
--
-- Define filetype associations for .conf files

-- 1. General Rule: All .conf files are 'ini' by default
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.conf' },
  command = 'set filetype=ini',
})

-- 2. Specific Rule: Hyprland files are 'hyprlang'
--    (This will override the general rule above for these files)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    -- Pattern 1: Any .conf inside a 'hypr' directory
    '*/hypr/*.conf',

    -- Pattern 2: Official filenames from the Hyprland ecosystem
    'hyprland.conf',
    'hypridle.conf',
    'hyprlock.conf',
    'hyprpaper.conf',
    'hyprtheme.conf',
    'hyprsunset.conf',

    -- Pattern 3: Official extension
    '*.hl',
  },
  command = 'set filetype=hyprlang',
})
