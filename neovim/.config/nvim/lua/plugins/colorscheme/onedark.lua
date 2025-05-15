return {
  {
    "navarasu/onedark.nvim",
    config = function()
      local od = require("onedark")
      od.setup({
        style = "deep",
      })
      od.load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
