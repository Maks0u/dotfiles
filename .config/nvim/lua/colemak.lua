-- [[ Colemak ]]
-- Inspired by https://github.com/jooize/vim-colemak
--    e    |    k
--  h   i  |  h   l
--    n    |    j

local map = function(mode, keys, fn, desc)
    vim.keymap.set(mode, keys, fn, { desc = desc, remap = false })
end

map('', 'h', 'h', 'Left')
map('', 'H', '^', 'Start of line')
map('', 'n', 'j', 'Down')
map('', 'N', '}', 'Down')
map('', 'e', 'k', 'Up')
map('', 'E', '{', 'Up')
map('', 'i', 'l', 'Right')
map('', 'I', '$', 'End of line')

map('n', '<M-e>', ':m -2<CR>', 'Move line up')
map('n', '<M-n>', ':m +1<CR>', 'Move line down')
map('x', '<M-e>', ":m '<-2<CR>gv=gv", 'Move selection up')
map('x', '<M-n>', ":m '>+1<CR>gv=gv", 'Move selection down')

map('', 'j', 'z')

map('', 'l', 'b', 'Back word')
map('', 'L', 'B', 'Back WORD')
map('', 'u', 'w', 'Forward word')
map('', 'U', 'W', 'Forward WORD')
map('', 'y', 'e', 'Forward end of word')
map('', 'Y', 'E', 'Forward end of WORD')

map('', 'f', 'f',   'Move to next {char}')
map('', 'F', 'F',   'Move to previous {char}')
map('', 'p', 't',   'Move before next {char}')
map('', 'P', 'T',   'Move after previous {char}')
map('', 'b', ';',   'Repeat latest f or t')
map('', 'B', ',',   'Repeat latest f or t reversed')
map('', 'k', 'nzz', 'Repeat latest / or ?')
map('', 'K', 'Nzz', 'Repeat latest / or ? reversed')

map( 'n',      'a',     'v',     'Visual')
map(     'x',  'a',     '<C-V>', 'Cycle Visual bloc')
map({'n','x'}, 'A',     'V',     'Visual line')
map({'n','x'}, '<C-A>', '<C-V>', 'Visual bloc')
map( 'n',      'ga',    'gv',    'Reselect last visual selection')
map( 'n',      '<M-a>', 'ggVG',  'Select all')

map( 'n',      's', 'i', 'Insert')
map({'n','x'}, 'S', 'I', 'Insert start of line')
-- Inner operator (operator pending & visual mode)
-- Example: dip -> dsp (Delete inner paragraph)
-- Example: viw -> asw (Select inner word)
map({'o','x'}, 's', 'i', 'Inner')
vim.keymap.del({'o','x'}, 'in') -- remap default from <nvim_install_dir>/share/nvim/runtime/lua/vim/_core/defaults.lua
map({'o','x'}, 'sn', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require 'vim.treesitter._select'.select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, 'Select child (inner) node')

map( 'n',      't', 'a', 'Append')
map({'n','x'}, 'T', 'A', 'Append at end of line')
-- Outer operator (operator pending & visual mode)
map({'o','x'}, 't', 'a', 'Outer')
vim.keymap.del({'o','x'}, 'an') -- remap default from <nvim_install_dir>/share/nvim/runtime/lua/vim/_core/defaults.lua
map({'o','x'}, 'tn', function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require 'vim.treesitter._select'.select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, 'Select parent (outer) node')

map({'n','x'}, 'w', 'c',   'Change')
map( 'n',      'W', 'C',   'Change to end of line')
map( 'n',      'ww', 'cc', 'Change line')

map('n', 'O', 'O<Esc>', 'Insert line before')
map('n', 'o', 'o<Esc>', 'Insert line after')

-- Uppercase Lowercase
map('x', '<Leader>O', 'U', 'Uppercase selection')
map('x', '<Leader>o', 'u', 'Lowercase selection')
map('', 'gO', 'gU', 'Uppercase')
map('', 'go', 'gu', 'Lowercase')

-- Undo and Redo
map('n', 'z',  'u',     'Undo')
map('n', 'Z',  '<C-R>', 'Redo')
map('n', 'gz', 'U',     'Undo all latest changes on line')

-- Copy, Cut, Paste
map({'n','x'}, 'c',  'y',     'Copy')
map( 'n',      'cc', 'yy',    'Copy line')
map( 'n',      'C',  'yy',    'Copy line')
map( 'n',      'x',  'vygvx', 'Cut')
map(     'x',  'x',  'ygvx',  'Cut')
map(     'x',  'X',  'ygvx',  'Cut')
map( 'n',      'X',  'yydd',  'Cut line')
-- Always paste prevously yanked text (not deleted text)
map({'n','x'}, 'v',  '"0p',   'Paste')
map({'n','x'}, 'V',  '"0P',   'Paste before')

map({'n','x'}, 'gK', 'K', 'Lookup')
map({'n','x'}, 'ge', 'H', 'To line [count] from top of window')
map({'n','x'}, 'gn', 'L', 'To line [count] from bottom of window')

map({'n','t'}, '<C-h>', '<C-w>h', 'Move focus to the left window')
map({'n','t'}, '<C-y>', '<C-w>l', 'Move focus to the right window') -- <C-i> is interpreted as <Tab>
map({'n','t'}, '<C-n>', '<C-w>j', 'Move focus to the lower window')
map({'n','t'}, '<C-e>', '<C-w>k', 'Move focus to the upper window')
