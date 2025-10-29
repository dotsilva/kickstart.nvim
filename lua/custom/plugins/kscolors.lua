-- lua/plugins/kscolors.lua

return {
  'NvChad/nvim-colorizer.lua',
  lazy = false,
  priority = 1000,

  config = function()
    require('colorizer').setup {
      -- 1. Os filetypes que você quer
      filetypes = {
        'css',
        'scss',
        'toml',
        'yaml',
        'ini',
        'javascript',
        'typescript',
      },

      -- 2. A CORREÇÃO:
      -- Precisamos re-definir as opções que foram perdidas
      -- ao sobrescrever os 'filetypes'.
      user_default_options = {
        -- Esta é a flag principal que habilita (rgb, rgba, hsl, etc.)
        css = true,

        -- Apenas para garantir, ativamos explicitamente também:
        rgb_fn = true,
        names = true,
      },
    }
  end,
}
