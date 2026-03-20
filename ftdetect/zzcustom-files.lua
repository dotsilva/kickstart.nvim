vim.filetype.add {
  extension = {
    theme = 'dosini',
    -- Only necessary if you use non-standard file extensions for Hyprland
    -- hc = "hyprlang",
  },
  pattern = {
    -- You can use regex-like Lua patterns to match specific paths
    -- [".*/my_custom_configs/.*%.conf"] = "hyprlang",
  },
}
