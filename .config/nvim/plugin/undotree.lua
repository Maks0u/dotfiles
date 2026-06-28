vim.pack.add({
    'https://github.com/jiaoshijie/undotree',
})

local undotree = require('undotree')
undotree.setup({
    position = 'right',
    keymaps = {
        ['move_prev'] = 'e',
        ['move_next'] = 'n',
        ['move_change_prev'] = 'E',
        ['move_change_next'] = 'N',
        ['action_enter'] = '<CR>',
        ['enter_diffbuf'] = 'p',
        ['quit'] = 'q',
        ['update_undotree_view'] = '<F5>',
    }
})

vim.keymap.set('n', '<Leader>u', undotree.toggle, { desc = 'Toggle [U]ndo tree' })
