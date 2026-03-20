return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local function char_count()
        local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, true), "\n")
        return "chars: " .. vim.fn.strchars(text)
      end

      table.insert(opts.sections.lualine_x, char_count)
    end,
  },
}
