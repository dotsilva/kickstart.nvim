return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui', -- UI para o dadbod
      'kristijanhusak/vim-dadbod-completion', -- Completação para dadbod
    },
    config = function()
      -- Configuração opcional para o UI
      vim.g.db_ui_use_nerd_fonts = vim.g.have_nerd_font
      vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui_queries'
      vim.g.db_ui_table_helpers = {
        -- Mapeamentos úteis
        ['<CR>'] = 'DbUi_TableInfo',
        ['E'] = 'DbUi_TableInfo',
      }

      -- Atalhos
      vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', { desc = '[D]ata[B]ase UI' })
    end,
  },
}
