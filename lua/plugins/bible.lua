local custom_ui = {
  popup = {
    border = { style = vim.g.strong_border },
  },
  input = {
    border = { style = vim.g.strong_border },
  },
}

return {
  'dotsilva/bible-verse.nvim',
  cmd = { 'BibleVerse', 'BibleVerseQuery', 'BibleVerseInsert' },
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    diatheke = {
      translation = 'ASV',
    },
    formatter = {
      markdown = {
        quote_block = true,
      },
    },
    ui = custom_ui,
  },
  config = true,
  keys = {
    -- CORE COMMANDS
    { '<leader>bq', '<cmd>BibleVerseQuery<CR>', desc = 'Bible Query' },
    { '<leader>bi', '<cmd>BibleVerseInsert<CR>', desc = 'Bible Insert' },

    -- ENGLISH
    {
      '<leader>ba',
      function()
        require('bible-verse').setup { diatheke = { translation = 'ASV' }, ui = custom_ui }
        vim.notify('Module: ASV', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: ASV',
    },

    {
      '<leader>bl',
      function()
        require('bible-verse').setup { diatheke = { translation = 'LEB' }, ui = custom_ui }
        vim.notify('Module: LEB', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: LEB',
    },

    {
      '<leader>bk',
      function()
        require('bible-verse').setup { diatheke = { translation = 'KJV' }, ui = custom_ui }
        vim.notify('Module: KJV', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: KJV',
    },

    -- PORTUGUESE
    {
      '<leader>bp',
      function()
        require('bible-verse').setup { diatheke = { translation = 'PorAlmeida1911' }, ui = custom_ui }
        vim.notify('Módulo: Almeida 1911', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: PorAlmeida1911',
    },

    -- GREEK
    {
      '<leader>bs',
      function()
        require('bible-verse').setup { diatheke = { translation = 'SBLGNT' }, ui = custom_ui }
        vim.notify('Module: SBLGNT', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: SBLGNT',
    },
    {
      '<leader>bx',
      function()
        require('bible-verse').setup { diatheke = { translation = 'LXX' }, ui = custom_ui }
        vim.notify('Module: LXX', vim.log.levels.INFO, { title = 'Bible-Verse' })
      end,
      desc = 'Bible: LXX',
    },
  },
}
