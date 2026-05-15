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

require("which-key").add({
  {"<leader>fp", function()
      Snacks.picker.files({ cwd = "~/projects" })
    end,
    desc = "Projects dir"
  },
  {"<leader>zd", require("datemod").datemod,
    desc = "datemod",
    mode = {"v"}
  },
  {'<lsader>tc',  ':VimuxPromptCommand<CR>'},
  {'<leader>tl',  ':VimuxRunLastCommand<CR>'},
  {'<leader>ww',  ':w<CR>:VimuxRunLastCommand<CR>'},
  {'<leader>tt',  ':silent exec "!_tmux_exit_copy_mode > /dev/null 2>&1"<CR>'},
  {'<leader>tv0', ':let g:VimuxRunnerIndex=0<CR>'},
  {'<leader>tv1', ':let g:VimuxRunnerIndex=1<CR>'},
  {'<leader>tv2', ':let g:VimuxRunnerIndex=2<CR>'},
})


vim.keymap.set('n', '<leader>tc',  ':VimuxPromptCommand<CR>')
vim.keymap.set('n', '<leader>tl',  ':VimuxRunLastCommand<CR>')
vim.keymap.set('n', '<leader>ww',  ':w<CR>:VimuxRunLastCommand<CR>')
vim.keymap.set('n', '<leader>tt',  ':silent exec "!_tmux_exit_copy_mode > /dev/null 2>&1"<CR>')
vim.keymap.set('n', '<leader>tv0', ':let g:VimuxRunnerIndex=0<CR>')
vim.keymap.set('n', '<leader>tv1', ':let g:VimuxRunnerIndex=1<CR>')
vim.keymap.set('n', '<leader>tv2', ':let g:VimuxRunnerIndex=2<CR>')

-- {
--   "<leader>fe",
--   function()
--     Snacks.explorer({ cwd = LazyVim.root() })
--   end,
--   desc = "Explorer Snacks (root dir)",
-- },
