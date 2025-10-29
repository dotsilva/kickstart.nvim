-- lua/plugins/kstsitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- Use a função opts para mesclar com a configuração padrão
    opts = function(_, opts)
      -- Garante que a tabela exista
      opts.ensure_installed = opts.ensure_installed or {}

      -- Adiciona os parsers à lista de instalação
      vim.list_extend(opts.ensure_installed, {
        'bash',
        'toml',
        'ini',
        'hyprlang', -- <<--- ADICIONE ESTA LINHA
      })

      -- Retorna a tabela 'opts' modificada
      return opts
    end,
  },
}
