vim.pack.add({
    'https://github.com/j-hui/fidget.nvim',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/folke/which-key.nvim',
})

require('fidget').setup()
vim.keymap.set('n', '<Leader>n', '<cmd>Fidget history<CR>', { desc = '[N]otification history' })

require('ibl').setup() -- indent-blankline

require('lualine').setup()

require('mini.icons').setup()

require('mini.pairs').setup()

require('mini.surround').setup({
    mappings = {
        add = '<Leader>s',
        delete = '<Leader>sd',
        find = '',
        find_left = '',
        highlight = '',
        replace = '<Leader>sr',
    },
})

require('nvim-highlight-colors').setup()

require('which-key').setup({
    spec = {
        { '<Leader>b', group = '[B]uffer', mode = { 'n', 'x' } },
        { '<Leader>g', group = '[G]it', mode = { 'n', 'x' } },
        { '<Leader>s', group = '[S]urround', mode = { 'n' } },
    }
})
