-- NeoVim init.lua
-- Repo: https://github.com/Maks0u/env
--
-- Inspirations
--   kickstart.nvim         (https://github.com/nvim-lua/kickstart.nvim)
--   kickstart-modular.nvim (https://github.com/dam9000/kickstart-modular.nvim)
--   Melkeydev config       (https://github.com/Melkeydev/neovim)

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'x' }, '<Space>', '')

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'config.options'
require 'config.keymaps'
require 'config.lazy'
