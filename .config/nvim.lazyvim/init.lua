-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "x" }, "<Space>", "")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
