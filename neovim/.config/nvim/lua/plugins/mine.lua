-- if true then
--   return {}
-- end

return {
  { "alexghergh/nvim-tmux-navigation" },
  { "ovk/endec.nvim" },

  -- mine
  { dir = "~/.vim/plugged/x12" },
  { dir = "~/.vim/plugged/notes" },
  {
    name = "datemod",
    dir = "~/.local/share/nvim/datemod",
    dev = true,
    -- "datemod",
    -- name = "datemod",
    -- dev = {true}
  },

  -- { "christoomey/vim-tmux-navigator", opts = { lazy = false } },
  -- { "tinted-theming/base16-vim" },
}
