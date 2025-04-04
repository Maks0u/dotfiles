-- NeoVim init.lua
-- Repo: https://github.com/Maks0u/env
-- Based on kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim)

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({'n','x'}, '<Space>', '')

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require('options')
require('keymaps')
