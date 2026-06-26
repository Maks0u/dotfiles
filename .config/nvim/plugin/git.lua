vim.pack.add({
    'https://github.com/lewis6991/gitsigns.nvim',
})

local gitsigns = require('gitsigns')

gitsigns.setup({
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 0,
        virt_text_pos = 'right_align',
    },
})

vim.keymap.set('n', '<Leader>gb', function()
    gitsigns.blame()
end, { desc = 'Git [b]lame' })

vim.keymap.set('n', '<Leader>gl', function()
    gitsigns.blame_line({ full = true })
end, { desc = 'Git blame [l]ine' })

vim.keymap.set('n', '<Leader>gd', function()
    gitsigns.diffthis()
end, { desc = 'Git [d]iff' })

vim.keymap.set('n', ']g', function()
    gitsigns.nav_hunk('next')
end, { desc = '[G]it next hunk' })

vim.keymap.set('n', '[g', function()
    gitsigns.nav_hunk('prev')
end, { desc = '[G]it previous hunk' })

vim.keymap.set('n', '<Leader>gp', function()
    gitsigns.preview_hunk()
end, { desc = 'Git [p]review hunk' })

vim.keymap.set('n', '<Leader>gi', function()
    gitsigns.preview_hunk_inline()
end, { desc = 'Git preview hunk [i]nline' })

vim.keymap.set('n', '<Leader>gs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Git [s]tage or unstage hunk' })
vim.keymap.set('x', '<Leader>gs', "<cmd>'<,'>Gitsigns stage_hunk<CR>", { desc = 'Git [s]tage or unstage hunk' })
vim.keymap.set('n', '<Leader>gr', '<cmd>Gitsigns reset_hunk<CR>', { desc = 'Git [r]eset hunk' })
vim.keymap.set('x', '<Leader>gr', "<cmd>'<,'>Gitsigns reset_hunk<CR>", { desc = 'Git [r]eset hunk' })
