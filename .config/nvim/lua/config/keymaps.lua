-- [[ Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Escape with ; in visual mode
vim.keymap.set('x', ';', '<Esc>', { desc = 'Exit visual mode' })

-- End of line
vim.keymap.set('', '-', '$', { desc = 'End of line' })

-- Switch tabs in normal mode
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { desc = 'Next Tab', silent = true })
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { desc = 'Previous Tab', silent = true })

-- Indent using tab in visual mode
vim.keymap.set('x', '<Tab>', '>gv', { desc = 'Indent' })
vim.keymap.set('x', '<S-Tab>', '<gv', { desc = 'Outdent' })

-- [[ Colemak ]]
-- Inspired by https://github.com/jooize/vim-colemak
--    e    |    k
--  h   i  |  h   l
--    n    |    j

vim.keymap.set('', 'h', 'h',   { desc = 'Left' })
vim.keymap.set('', 'H', '^',   { desc = 'Start of line' })
vim.keymap.set('', 'n', 'j',   { desc = 'Down' })
vim.keymap.set('', 'N', '10j', { desc = '10 Down' })
vim.keymap.set('', 'e', 'k',   { desc = 'Up' })
vim.keymap.set('', 'E', '10k', { desc = '10 Up' })
vim.keymap.set('', 'i', 'l',   { desc = 'Right' })
vim.keymap.set('', 'I', '$',   { desc = 'End of line' })

vim.keymap.set('n', '<M-e>', ':m<space>-2<CR>', { desc = 'Move line up' })
vim.keymap.set('n', '<M-n>', ':m<space>+1<CR>', { desc = 'Move line down' })
vim.keymap.set('x', '<M-e>', ':m<space>\'<-2<CR>gv=gv', { desc = 'Move selection up' })
vim.keymap.set('x', '<M-n>', ':m<space>\'>+1<CR>gv=gv', { desc = 'Move selection down' })

vim.keymap.set('', 'J', 'ZZ', { desc = 'Save and quit' })
vim.keymap.set('', 'Q', 'ZQ', { desc = 'Quit without saving' })
vim.keymap.set('', '<Leader>w', ':w<CR>', { desc = 'Save' })
vim.keymap.set('', '<Leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('', '<Leader>wq', ':wq<CR>', { desc = 'Save and quit' })

vim.keymap.set('', 'j', 'z')

-- Center screen when moving
vim.keymap.set('', '{', '{zz')
vim.keymap.set('', '}', '}zz')

vim.keymap.set('', 'l', 'b', { desc = 'Back word' })
vim.keymap.set('', 'L', 'B', { desc = 'Back WORD' })
vim.keymap.set('', 'u', 'e', { desc = 'Forward end of word' })
vim.keymap.set('', 'U', 'E', { desc = 'Forward end of WORD' })
vim.keymap.set('', 'y', 'w', { desc = 'Forward word' })
vim.keymap.set('', 'Y', 'W', { desc = 'Forward WORD' })

vim.keymap.set('', 'f', 'f',   { desc = 'Move to next {char}' })
vim.keymap.set('', 'F', 'F',   { desc = 'Move to previous {char}' })
vim.keymap.set('', 'p', 't',   { desc = 'Move before next {char}' })
vim.keymap.set('', 'P', 'T',   { desc = 'Move after previous {char}' })
vim.keymap.set('', 'b', ';',   { desc = 'Repeat latest f or t' })
vim.keymap.set('', 'B', ',',   { desc = 'Repeat latest f or t reversed' })
vim.keymap.set('', 'k', 'nzz', { desc = 'Repeat latest / or ?' })
vim.keymap.set('', 'K', 'Nzz', { desc = 'Repeat latest / or ? reversed' })

vim.keymap.set( 'n',      'a',     'v',     { desc = 'Visual' })
vim.keymap.set(     'x',  'a',     '<C-V>', { desc = 'Cycle Visual bloc' })
vim.keymap.set({'n','x'}, 'A',     'V',     { desc = 'Visual line' })
vim.keymap.set({'n','x'}, '<C-A>', '<C-V>', { desc = 'Visual bloc' })
vim.keymap.set( 'n',      'ga',    'gv',    { desc = 'Reselect last visual selection' })

vim.keymap.set( 'n',      's', 'i', { desc = 'Insert' })
vim.keymap.set({'n','x'}, 'S', 'I', { desc = 'Insert start of line' })
-- Inner operator (operator pending & visual mode)
-- Example: dip -> dsp (Delete inner paragraph)
-- Example: viw -> asw (Select inner word)
vim.keymap.set({'o','x'}, 's', 'i', { desc = 'Inner' })

vim.keymap.set( 'n',      't', 'a', { desc = 'Append' })
vim.keymap.set({'n','x'}, 'T', 'A', { desc = 'Append at end of line' })
-- Outer operator (operator pending & visual mode)
vim.keymap.set({'o','x'}, 't', 'a', { desc = 'Outer' })

vim.keymap.set({'n','x'}, 'w', 'c',   { desc = 'Change' })
vim.keymap.set( 'n',      'W', 'C',   { desc = 'Change to end of line' })
vim.keymap.set( 'n',      'ww', 'cc', { desc = 'Change line' })

vim.keymap.set('n', 'O', 'O<Esc>', { desc = 'Insert line before' })
vim.keymap.set('n', 'o', 'o<Esc>', { desc = 'Insert line after' })

-- Uppercase Lowercase
vim.keymap.set('x', '<Leader>O', 'U', { desc = 'Uppercase selection' })
vim.keymap.set('x', '<Leader>o', 'u', { desc = 'Lowercase selection' })
vim.keymap.set('', 'gO', 'gU', { desc = 'Uppercase' })
vim.keymap.set('', 'go', 'gu', { desc = 'Lowercase' })

-- Undo and Redo
vim.keymap.set('n', 'z',  'u',     { desc = 'Undo' })
vim.keymap.set('n', 'Z',  '<C-R>', { desc = 'Redo' })
vim.keymap.set('n', 'gz', 'U',     { desc = 'Undo all latest changes on line' })

-- Copy, Cut, Paste
vim.keymap.set({'n','x'}, 'c',  'y',     { desc = 'Copy' })
vim.keymap.set( 'n',      'cc', 'yy',    { desc = 'Copy line' })
vim.keymap.set( 'n',      'C',  'yy',    { desc = 'Copy line' })
vim.keymap.set( 'n',      'x',  'vygvx', { desc = 'Cut' })
vim.keymap.set(     'x',  'x',  'ygvx',  { desc = 'Cut' })
vim.keymap.set(     'x',  'X',  'ygvx',  { desc = 'Cut' })
vim.keymap.set( 'n',      'X',  'yydd',  { desc = 'Cut line' })
-- Always paste prevously yanked text (not deleted text)
vim.keymap.set({'n','x'}, 'v',  '"0p',   { desc = 'Paste' })
vim.keymap.set({'n','x'}, 'V',  '"0P',   { desc = 'Paste before' })

vim.keymap.set({'n','x'}, 'gK', 'K', { desc = 'Lookup' })
vim.keymap.set({'n','x'}, 'ge', 'H', { desc = 'To line [count] from top of window' })
vim.keymap.set({'n','x'}, 'gn', 'L', { desc = 'To line [count] from bottom of window' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-i>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-n>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-e>', '<C-w>k', { desc = 'Move focus to the upper window' })
