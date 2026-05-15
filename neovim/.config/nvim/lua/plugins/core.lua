-- if true then
--   return {}
-- end

return {
  -- disable noice for now
  { "rcarriga/nvim-notify", enabled = false },
  {
    "folke/noice.nvim",
    enabled = false,
    opts = {
    },
  },

  {
    "folke/lazy.nvim",
    tag = "stable", -- Pin to the latest stable tag
  },

  {
    "ahmedkhalf/project.nvim",
    opts = {
      patterns = { ">~/Documents/projects" },
    },
  },
}
