-- ~/.config/nvim-kickstart/ftdetect/conf.lua
--
-- Define associações de filetype para arquivos .conf

-- 1. Regra Geral: Todo .conf é 'ini' por padrão
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.conf' },
  command = 'set filetype=ini',
})

-- 2. Regra Específica: Arquivos conhecidos do Hyprland são 'hyprlang'
--    (Isso vai sobrescrever a regra geral acima para estes arquivos)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    -- Arquivos da sua lista
    'hyprland.conf',
    'hypridle.conf',
    'hyprlock.conf',
    'bindings.conf',
    'autostart.conf',
    'envs.conf',
    'hyprsunset.conf',
    'input.conf',
    'looknfeel.conf',
    'monitors.conf',

    -- Outros arquivos comuns (para o futuro)
    'hyprpaper.conf',
    'hyprtheme.conf',
    'windowrules.conf',
    '*.hl',
  },
  command = 'set filetype=hyprlang',
})
