vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
})

local oil = require('oil')

oil.setup({
    default_file_explorer = true,
    delete_to_trash = false,
    columns = {
        'icon',
    },
    view_options = {
        case_insensitive = true,
        show_hidden = true,
    },
    use_default_keymaps = false,
    keymaps = {
        ['?'] = { 'actions.show_help', desc = 'Help' },
        ['q'] = { 'actions.close', desc = 'Close' },
        ['<CR>'] = { 'actions.select', desc = 'Open file(s)' },
        ['<C-e>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in vretical split' },
        ['<C-n>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open in horizontal split' },
        ['<BS>'] = { 'actions.parent', desc = 'Parent' },
        ['p'] = { 'actions.preview', desc = 'Preview' },
        ['<C-c>'] = { 'actions.yank_entry', desc = 'Copy filepath' },
        ['_'] = { 'actions.open_cwd', mode = 'n', desc = 'Go to CWD' },
        ['`'] = { 'actions.cd', mode = 'n', desc = 'Change CWD' },
        ['.'] = { 'actions.toggle_hidden', mode = 'n' },
        [','] = {
            desc = 'Toggle file detail view',
            callback = function()
                OIL_DETAILS = not OIL_DETAILS
                if OIL_DETAILS then
                    require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
                else
                    require('oil').set_columns({ 'icon' })
                end
            end,
        },
        ['<Tab>'] = { '', desc = 'Disabled' },
    },
})

vim.keymap.set('', '\\', oil.toggle_float, { desc = 'Toggle Oil floating window' })
vim.keymap.set('', '<Leader>e', oil.toggle_float, { desc = 'Toggle Oil floating window' })
