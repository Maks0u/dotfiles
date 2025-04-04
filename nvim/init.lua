-- NeoVim init.lua
-- Repo: https://github.com/Maks0u/env
-- Based on kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim)

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.keymap.set({'n','x'}, '<Space>', '')

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true


-- [[ Options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`

-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, useful for resizing splits
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Scroll offset
vim.opt.scrolloff = 10

-- Prompt confirm instead of throwing an error when trying to exit without saving
vim.opt.confirm = true

-- Indent with spaces
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Show keystrokes in status line
vim.opt.showcmd = true

-- Virtual editing (cursor can move anywhere)
vim.opt.virtualedit = 'all'
-- nowrap

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true


-- [[ Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Escape with ; in visual mode
vim.keymap.set('x', ';', '<Esc>', { desc = 'Exit visual mode' })

-- End of line
vim.keymap.set('', '-', '$')

-- Switch tabs in normal mode
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { desc = 'Previous Tab' })

-- Indent using tab in visual mode
vim.keymap.set('x', '<Tab>', '>gv')
vim.keymap.set('x', '<S-Tab>', '<gv')

-- [[ Colemak ]]
-- Inspired by https://github.com/jooize/vim-colemak
--    e    |    k
--  h   i  |  h   l
--    n    |    j

-- Left
vim.keymap.set('', 'h', 'h')
vim.keymap.set('', 'H', '10h')
-- Down
vim.keymap.set('', 'n', 'j')
vim.keymap.set('', 'N', '10j')
-- Up
vim.keymap.set('', 'e', 'k')
vim.keymap.set('', 'E', '10k')
-- Right
vim.keymap.set('', 'i', 'l')
vim.keymap.set('', 'I', '10l')

-- 
vim.keymap.set('', 'j', 'z')

-- Center screen when moving
vim.keymap.set('', '{', '{zz')
vim.keymap.set('', '}', '}zz')

-- Back word
vim.keymap.set('', 'l', 'b')
-- Back WORD
vim.keymap.set('', 'L', 'B')
-- Forward end of word
vim.keymap.set('', 'u', 'e')
-- Forward end of WORD
vim.keymap.set('', 'U', 'E')
-- Forward word
vim.keymap.set('', 'y', 'w')
-- Forward WORD
vim.keymap.set('', 'Y', 'W')

-- Before next t{char}
vim.keymap.set('', 'p', 't')
-- After previous t{char}
vim.keymap.set('', 'P', 'T')
-- Repeat latest f or t
vim.keymap.set('', 'b', ';')
-- Repeat latest f or t reversed
vim.keymap.set('', 'B', ',')
-- Repeat latest / or ?
vim.keymap.set('', 'k', 'nzz')
-- Repeat latest / or ? reversed
vim.keymap.set('', 'K', 'Nzz')

-- Visual
vim.keymap.set('n', 'a', 'v')
-- Cycle Visual bloc
vim.keymap.set('x', 'a', '<C-V>')
-- Visual line
vim.keymap.set({'n','x'}, 'A', 'V')
-- Visual bloc
vim.keymap.set({'n','x'}, '<C-A>', '<C-V>')
-- Reselect last visual selection
vim.keymap.set('n', 'ga', 'gv')

-- Insert
vim.keymap.set('n', 's', 'i')
-- Inner operator (operator pending & visual mode)
-- Example: dip -> dsp (Delete inner paragraph)
-- Example: viw -> asw (Select inner word)
vim.keymap.set({'o','x'}, 's', 'i')
-- Insert start of line
vim.keymap.set({'n','x'}, 'S', 'I')

-- Append
vim.keymap.set('n', 't', 'a')
-- Outer operator (operator pending & visual mode)
vim.keymap.set({'o','x'}, 't', 'a')
-- Append at end of line
vim.keymap.set({'n','x'}, 'T', 'A')

-- Change
vim.keymap.set({'n','x'}, 'w', 'c')
-- Change to end of line
vim.keymap.set('n', 'W', 'C')
-- Change line
vim.keymap.set('n', 'ww', 'cc')

-- Insert line before
vim.keymap.set('n', 'O', 'O<Esc>')
-- Insert line after
vim.keymap.set('n', 'o', 'o<Esc>')

-- Uppercase selection
vim.keymap.set('x', '<Leader>O', 'U')
-- Lowercase selection
vim.keymap.set('x', '<Leader>o', 'u')
-- Uppercase
vim.keymap.set('', 'gO', 'gU')
-- Lowercase
vim.keymap.set('', 'go', 'gu')

-- Save and quit
vim.keymap.set('', 'J', 'ZZ')
-- Quit without saving
vim.keymap.set('', 'Q', 'ZQ')

-- Undo
vim.keymap.set('n', 'z', 'u')
-- Redo
vim.keymap.set('n', 'Z', '<C-R>')
-- Undo all latest changes on line
vim.keymap.set('n', 'gz', 'U')
-- Cut
vim.keymap.set({'n','x'}, 'x', 'vygvx')
-- Cut line
vim.keymap.set({'n','x'}, 'X', 'yydd')
-- Copy
vim.keymap.set({'n','x'}, 'c', 'y')
-- Copy line
vim.keymap.set('n', 'cc', 'yy')
vim.keymap.set('n', 'C', 'yy')
-- Paste
-- vim.keymap.set('n', 'v', 'p')
-- vim.keymap.set('n', 'V', 'P')
-- Always paste prevously yanked text (not deleted text)
vim.keymap.set({'n','x'}, 'v', '"0P')
vim.keymap.set({'n','x'}, 'V', '"0P')

-- Lookup
vim.keymap.set({'n','x'}, 'gK', 'K')
-- To line [count] from top of window
vim.keymap.set({'n','x'}, 'ge', 'H')
-- To line [count] from bottom of window
vim.keymap.set({'n','x'}, 'gn', 'L')

-- Switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-i>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-n>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-e>', '<C-w>k', { desc = 'Move focus to the upper window' })
