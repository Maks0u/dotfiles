-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

vim.opt.cursorline = false

-- [[ Options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

vim.opt.number = true -- Show relative line numbers
vim.opt.relativenumber = true

vim.opt.mouse = "a" -- Enable mouse mode, useful for resizing splits

vim.opt.undofile = true -- Save undo history

vim.opt.ignorecase = true -- Ignore case when searching

vim.opt.scrolloff = 10 -- Scroll offset
vim.opt.sidescrolloff = 10

vim.opt.confirm = true -- Prompt confirm instead of throwing an error when trying to exit without saving

vim.opt.autoindent = true
vim.opt.expandtab = true -- Indent with spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.showcmd = true -- Show keystrokes in status line

vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

vim.opt.inccommand = "split" -- Preview substitutions

vim.opt.virtualedit = "all" -- Virtual editing (cursor can move anywhere)

vim.opt.wrap = false -- Don't wrap lines

vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true

vim.opt.clipboard = "unnamedplus" -- Sync clipboard
