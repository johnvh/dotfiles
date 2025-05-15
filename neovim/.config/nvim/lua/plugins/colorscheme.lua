-- require("tinted-vim")

-- if true then
--   return {}
-- end

-- to try:
-- - https://dotfyle.com/plugins/maxmx03/fluoromachine.nvim
-- - https://dotfyle.com/plugins/oxfist/night-owl.nvim
-- - https://github.com/tanvirtin/monokai.nvim
-- - https://github.com/zootedb0t/citruszest.nvim
if true then
  -- return require('plugins.colorscheme.kanagawa')
  return require('plugins.colorscheme.cyberdream')
end

return {
  -- {
  --   "tinted-theming/tinted-vim",
  --   lazy = false,
  --   config = function()
  --     local theme_file = "$HOME/.config/tinted-theming/theme_name"
  --     local f = io.open(theme_file, "r")
  --     local theme = string.gsub(f:read(), "%s+", "")
  --
  --     print("current theme", theme)
  --   end,
  -- },

  -- { "tiagovla/tokyodark.nvim", },


  -- {
  --   'maxmx03/fluoromachine.nvim',
  --   config = function ()
  --     local fm = require 'fluoromachine'
  --
  --     fm.setup {
  --       glow = true,
  --       theme = 'fluoromachine',
  --       transparent = true,
  --     }
  --   end
  -- },

  -- {
  --   'tanvirtin/monokai.nvim',
  --   config = function()
  --     -- require('monokai').setup { palette = require('monokai').pro }
  --     -- require('monokai').setup { palette = require('monokai').soda }
  --     require('monokai').setup { palette = require('monokai').ristretto }
  --   end
  -- },

  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     local od = require("onedark")
  --     od.setup({
  --       style = "deep",
  --     })
  --     od.load()
  --   end,
  -- },

  { "nyoom-engineering/oxocarbon.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      colorscheme = "oxocarbon",
    },
  },
}
