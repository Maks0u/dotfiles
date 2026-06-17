-- [[ Keymaps ]]
-- See `:help vim.keymap`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Escape with ; in visual mode
vim.keymap.set('x', ';', '<Esc>', { desc = 'Exit visual mode' })

-- End of line
vim.keymap.set('', '-', '$', { desc = 'End of line' })

-- Switch tabs in normal mode
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous Buffer'})
vim.keymap.set('n', '<Leader><Tab>', '<cmd>edit #<CR>', { desc = 'Back to other buffer' })

-- Indent using tab in visual mode
vim.keymap.set('x', '<Tab>', '>gv', { desc = 'Indent' })
vim.keymap.set('x', '<S-Tab>', '<gv', { desc = 'Outdent' })

-- Center screen when moving
vim.keymap.set('', '{', '{zz')
vim.keymap.set('', '}', '}zz')

-- Save & Quit
vim.api.nvim_create_user_command('W', 'w', { desc = 'Save' })
vim.api.nvim_create_user_command('Q', 'q', { desc = 'Quit' })
vim.keymap.set('', 'J', 'ZZ', { desc = 'Save and quit' })
-- vim.keymap.set('', 'Q', 'ZQ', { desc = 'Quit without saving' })
vim.keymap.set('', '<Leader>w', '<cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('', '<Leader>q', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('', '<Leader>wq', '<cmd>wq<CR>', { desc = 'Save and quit' })

-- Buffers
vim.keymap.set('', '<Leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete [b]uffer' })
vim.keymap.set('', '<Leader>bo', '<cmd>update<CR><cmd>%bdelete<CR><cmd>edit #<CR>`"<cmd>bdelete #<CR>', { desc = 'Delete [o]ther buffers' })

vim.keymap.set('', '<Leader>p', function()
    vim.fn.setreg('0', vim.fn.expand('%'))
end, { desc = 'Copy filepath' })

-- Load colemak keymaps
require('colemak')
