-- NeoVim init.lua
-- Repo: https://github.com/Maks0u/dotfiles
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

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})
