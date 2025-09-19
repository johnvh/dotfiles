
return {
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        -- main, moon, or dawn
        dark_variant = "main"
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}

