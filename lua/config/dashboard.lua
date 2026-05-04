vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Only show the dashboard if Neovim is opened without a specific file
    if vim.fn.argc() ~= 0 then return end

    -- WAIT for Neovim and all plugins to fully boot before creating the UI
    vim.schedule(function()
      -- Create a blank buffer
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_set_current_buf(buf)

      -- Make it a standard, dumb text buffer
      vim.bo[buf].buftype = 'nofile'
      vim.bo[buf].bufhidden = 'wipe'
      vim.bo[buf].swapfile = false

      vim.bo[buf].filetype = 'dashboard'

      -- Kill the tildes at the bottom & hide line numbers
      vim.opt_local.fillchars:append 'eob: '
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.signcolumn = 'no'

      -- Fetch STRICTLY global recent files (Increased to Top 20)
      local oldfiles = {}
      for _, file in ipairs(vim.v.oldfiles) do
        if vim.uv.fs_stat(file) and not vim.tbl_contains(oldfiles, file) then
          local clean_path = file:gsub(vim.env.HOME, '~')
          table.insert(oldfiles, clean_path)
          if #oldfiles >= 20 then break end -- Increased limit here
        end
      end

      -- Build the raw text block
      local raw_lines = {
        '====================================================',
        '...whatsoever ye do, do all to the glory of God.',
        '',
        '- I Corinthians 10:31 - ASV 1901',
        '====================================================',
        '',
        '',
        'Recent files',
        '----------------------------------------------------',
        '',
      }
      for _, file in ipairs(oldfiles) do
        table.insert(raw_lines, file)
      end

      -- === THE CENTERING MATH ===
      local win_width = vim.api.nvim_win_get_width(0)
      local win_height = vim.api.nvim_win_get_height(0)

      -- Find the longest line to calculate horizontal padding
      local max_len = 0
      for _, line in ipairs(raw_lines) do
        if #line > max_len then max_len = #line end
      end

      local pad_left = string.rep(' ', math.floor((win_width - max_len) / 2))
      local pad_top = math.floor((win_height - #raw_lines) / 2) - 2 -- Adjusted slightly up for visual weight

      -- Apply the padding
      local centered_lines = {}
      for _ = 1, pad_top do
        table.insert(centered_lines, '')
      end
      for _, line in ipairs(raw_lines) do
        if line == '' then
          table.insert(centered_lines, '')
        else
          table.insert(centered_lines, pad_left .. line)
        end
      end

      -- Print the centered text to the screen
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, centered_lines)
      vim.bo[buf].modifiable = false

      -- Create a dedicated namespace for the dashboard engine
      local ns = vim.api.nvim_create_namespace 'dashboard'

      -- THE COVENANT STATE MACHINE
      local current_zone = 'none'
      local equals_count = 0

      for i, line in ipairs(centered_lines) do
        local hl_group = nil

        -- Rule 1 & 3: Separators (3 or more '=' or '-') dictate our zone
        if line:match '===+' then
          hl_group = 'DashboardSeparator'
          equals_count = equals_count + 1

          -- If it's the first '===', we are entering the Verse zone
          if equals_count == 1 then
            current_zone = 'verse'
          -- If it's the second '===', we are entering the Title zone
          elseif equals_count == 2 then
            current_zone = 'title'
          end
        elseif line:match '%-%-%-+' then
          hl_group = 'DashboardSeparator'
          -- When we hit '---', we enter the Paths zone
          current_zone = 'paths'

        -- Rule 2, 4 & 5: Apply highlights based on what zone we are currently in
        -- We use line:match("%S") to ensure we only highlight lines that actually have text, ignoring blank spacer lines
        elseif line:match '%S' then
          if current_zone == 'verse' then
            hl_group = 'DashboardVerse'
          elseif current_zone == 'title' then
            hl_group = 'DashboardTitle'
          elseif current_zone == 'paths' then
            hl_group = 'DashboardPath'
          end
        end

        -- Inject the calculated highlight into the buffer
        if hl_group then vim.api.nvim_buf_set_extmark(buf, ns, i - 1, 0, {
          end_col = #line,
          hl_group = hl_group,
        }) end
      end

      -- Make <CR> open the file under your cursor (Ignores padding and titles)
      vim.keymap.set('n', '<CR>', function()
        local line = vim.api.nvim_get_current_line()
        local path = line:match '^%s*(.+)$' -- Strips all that left padding we just added

        if path then
          path = path:gsub('^~', vim.env.HOME)
          -- Only open if it's a real file (prevents crashing if you hit Enter on the "Recents" title)
          if vim.uv.fs_stat(path) then vim.cmd('edit ' .. path) end
        end
      end, { buffer = buf })
    end) -- end of vim.schedule
  end,
})
