-- lua/plugins/kstsitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Use the opts function to merge with the default config
    opts = function(_, opts)
      -- Ensure the table exists
      opts.ensure_installed = opts.ensure_installed or {}

      -- Add 'bash', 'toml', and 'ini' to the installation list
      vim.list_extend(opts.ensure_installed, {
        'bash', -- You already had this one
        'toml', -- Added for .toml
        'ini', -- Added for .ini and .conf
      })

      -- Return the modified 'opts' table
      return opts
    end,
  },
}
