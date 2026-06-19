vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
})

require('oil').setup({
    default_file_explorer = true,
    delete_to_trash = true,
    columns = {
        'icon',
    },
    view_options = {
        case_insensitive = true,
        show_hidden = true,
    },
    use_default_keymaps = false,
    keymaps = {
        ['?'] = { 'actions.show_help', mode = 'n' },
        ['<F5>'] = 'actions.refresh',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<BS>'] = { 'actions.parent', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['p'] = 'actions.preview',
        ['<C-u>'] = 'acitons.preview_scroll_up',
        ['<C-d>'] = 'acitons.preview_scroll_down',
        ['<C-c>'] = 'actions.yank_entry',
        ['q'] = { 'actions.close', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['<M-h>'] = { 'actions.toggle_hidden', mode = 'n' },
        ['gt'] = { 'actions.toggle_trash', mode = 'n' },
        ['gd'] = {
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
    },
})

vim.keymap.set('n', '\\', function()
    require('oil').toggle_float()
end, { desc = 'Toggle Oil floating window' })
