return {
  'nvim-mini/mini.icons',
  lazy = true,
  opts = {
    -- You can customize specific filetype colors here to match Covenant if you want,
    -- but the defaults map cleanly to standard Nerd Font colors.
  },
  init = function()
    -- This intercepts any plugin asking for the old, bloated devicons
    -- and serves them using the lightweight mini.icons engine instead.
    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end,
  config = function(_, opts)
    require('mini.icons').setup(opts)
  end,
}
