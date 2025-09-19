return {
  {
    "cpea2506/one_monokai.nvim",
    config = function ()
      require("one_monokai").setup({
        transparent = true
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "one_monokai"
    }
  }
}
