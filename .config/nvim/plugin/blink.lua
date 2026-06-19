vim.pack.add({
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'select_next', 'accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    },
    completion = {
        ghost_text = { enabled = true, show_with_menu = true },
        menu = { auto_show = false },
    },
})
