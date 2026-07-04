-- [[ Keymaps ]]
-- See `:help vim.keymap`

local map = function(mode, keys, fn, desc)
    vim.keymap.set(mode, keys, fn, { desc = desc, remap = false })
end

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights')

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-- Escape with ; in visual mode
map('x', ';', '<Esc>', 'Exit visual mode')

-- End of line
map('', '-', '$', 'End of line')

-- Switch tabs in normal mode
map('n', '<Tab>', '<cmd>bnext<CR>', 'Next Buffer')
map('n', '<S-Tab>', '<cmd>bprevious<CR>', 'Previous Buffer')
map('n', '<Leader><Tab>', '<cmd>edit #<CR>', 'Back to other buffer')

-- Indent using tab in visual mode
map('x', '<Tab>', '>gv', 'Indent')
map('x', '<S-Tab>', '<gv', 'Outdent')

-- Center screen when moving
map('', '{', '{zz')
map('', '}', '}zz')

-- Save & Quit
vim.api.nvim_create_user_command('W', 'w', { desc = 'Save' })
vim.api.nvim_create_user_command('Q', 'q', { desc = 'Quit' })
vim.keymap.set('', 'J', 'ZZ', { desc = 'Save and quit' })
-- vim.keymap.set('', 'Q', 'ZQ', { desc = 'Quit without saving' })
map('', '<Leader>w', '<cmd>w<CR>', 'Save')
map('', '<Leader>q', '<cmd>q<CR>', 'Quit')
map('', '<Leader>wq', '<cmd>wq<CR>', 'Save and quit')

-- Buffers
map('', '<Leader>bd', '<cmd>bdelete<CR>', 'Delete [b]uffer')
map('', '<Leader>bo', '<cmd>up<bar>%bd<bar>e#<bar>bd#<CR>`"zz', 'Delete [o]ther buffers')

map('', '<Leader>p', function()
    vim.fn.setreg('0', vim.fn.expand('%'))
end, 'Copy filepath')

-- Diagnostics
map('n', '<Leader>d', vim.diagnostic.open_float, '[D]iagnostic open float')

-- Load colemak keymaps
require('colemak')
