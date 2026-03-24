-- PATH/nvim/filetype.lua

vim.filetype.add {
  extension = {
    theme = 'dosini',
  },
  -- Add any future custom extensions or patterns here
}

-- this is the pattern
--[=[
vim.filetype.add({
  extension = {
    -- example: map .foo files to the 'lua' filetype
    foo = 'lua',
    -- your custom files here
  },
  filename = {
    -- example: specific filenames
    ['.env.local'] = 'sh',
  },
  pattern = {
    -- example: regex patterns
    ['.*%.env%.%w+'] = 'sh',
  },
})
]=]
