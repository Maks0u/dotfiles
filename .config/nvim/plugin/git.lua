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

local find_win = function (filetype)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == filetype then
            return win
        end
    end
end

local toggle_blame = function ()
    local blame_win = find_win('gitsigns-blame')
    if blame_win then
        vim.api.nvim_win_close(blame_win, false)
    else
        gitsigns.blame()
    end
end

vim.keymap.set('n', '<Leader>gb', toggle_blame, { desc = 'Git [b]lame' })

vim.keymap.set('n', '<Leader>gl', function()
    gitsigns.blame_line({ full = true })
end, { desc = 'Git blame [l]ine' })

local toggle_diff = function ()
    if vim.wo.diff then
        vim.cmd([[
            wincmd h
            quit
        ]])
    else
        gitsigns.diffthis()
    end
end

vim.keymap.set('n', '<Leader>gd', toggle_diff, { desc = 'Git [d]iff' })

vim.keymap.set('n', ']g', function()
    gitsigns.nav_hunk('next')
end, { desc = '[G]it next hunk' })

vim.keymap.set('n', '[g', function()
    gitsigns.nav_hunk('prev')
end, { desc = '[G]it previous hunk' })

vim.keymap.set('n', '<Leader>gp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
vim.keymap.set('n', '<Leader>gi', gitsigns.preview_hunk_inline, { desc = 'Git preview hunk [i]nline' })

vim.keymap.set('n', '<Leader>gs', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Git [s]tage or unstage hunk' })
vim.keymap.set('x', '<Leader>gs', "<cmd>'<,'>Gitsigns stage_hunk<CR>", { desc = 'Git [s]tage or unstage hunk' })
vim.keymap.set('n', '<Leader>gr', '<cmd>Gitsigns reset_hunk<CR>', { desc = 'Git [r]eset hunk' })
vim.keymap.set('x', '<Leader>gr', "<cmd>'<,'>Gitsigns reset_hunk<CR>", { desc = 'Git [r]eset hunk' })

vim.keymap.set('n', '<Leader>gS', '<cmd>Gitsigns stage_buffer<CR>', { desc = 'Git [S]tage or unstage buffer' })
vim.keymap.set('n', '<Leader>gR', '<cmd>Gitsigns reset_buffer<CR>', { desc = 'Git [R]eset buffer' })
