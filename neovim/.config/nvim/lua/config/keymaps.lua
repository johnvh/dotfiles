-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map("n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
-- map("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
-- map("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
-- map("n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

local nvim_tmux_nav = require("nvim-tmux-navigation")
vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

vim.keymap.set("n", "-", function()
  Snacks.explorer({
    cwd = vim.fn.expand("%:h"),
    focus = "list",
    matcher = { filename_bonus = true },
  })
end)

vim.keymap.set("n", "<leader>fp", function()
  Snacks.picker.files({ cwd = "~/projects" })
end)


vim.keymap.set("v", "<Leader>zd", require("datemod").datemod, { remap = false, silent = true })


-- {
--   "<leader>fe",
--   function()
--     Snacks.explorer({ cwd = LazyVim.root() })
--   end,
--   desc = "Explorer Snacks (root dir)",
-- },
