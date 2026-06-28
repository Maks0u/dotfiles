vim.pack.add({
    'https://github.com/akinsho/toggleterm.nvim',
})

require('toggleterm').setup({
    direction = 'vertical',
    float_opts = {
        border = 'rounded',
    },
    open_mapping = [[<C-\>]],
    size = function(term)
        if term.direction == 'horizontal' then
            return 15
        elseif term.direction == 'vertical' then
            return 100
        end
    end,
})

vim.keymap.set('n', '<Leader>t', '<cmd>ToggleTerm<CR>', { desc = 'Toggle [T]erminal' })
vim.keymap.set('n', '<Leader>gg', '<cmd>TermExec cmd="git-graph"<CR>', { desc = 'Git [G]raph' })
