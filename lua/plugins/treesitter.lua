return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local parsers = {
      'awk',
      'bash',
      'c',
      'css',
      'diff',
      'dockerfile',
      'editorconfig',
      'ecma',
      'embedded_template',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'gpg',
      'glsl',
      'html',
      'html_tags',
      'http',
      'hyprlang',
      'ini',
      'javascript',
      'jq',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'nginx',
      'query',
      'regex',
      'ruby',
      'sql',
      'ssh_config',
      'tmux',
      'toml',
      'vim',
      'vimdoc',
      'xcompose',
      'xml',
      'yaml',
      'zig',
    }
    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        if not vim.treesitter.language.add(language) then return end
        vim.treesitter.start(buf, language)

        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
