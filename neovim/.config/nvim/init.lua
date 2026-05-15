-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local fn = vim.fn
local cmd = vim.cmd
local set_theme_path = "$HOME/.config/tinted-theming/set_theme.lua"
local is_set_theme_file_readable = fn.filereadable(fn.expand(set_theme_path)) == 1 and true or false

-- if is_set_theme_file_readable then
--   cmd("let base16colorspace=256")
--   cmd("source " .. set_theme_path)
-- end

-- vim.api.nvim_create_user_command("ColorSource", function()
--   cmd("source " .. set_theme_path)
-- end, {})

vim.filetype.add({
  extension = {
    -- ['270'] = 'x12',
    thor = "ruby",
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*%yaml.gotmpl"] = "yaml",
    ["%.env.*"] = "sh",
    ["Gemfile.*"] = "ruby",
  },
})

vim.cmd("abbreviate zx 🦄")
