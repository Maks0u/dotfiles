vim.pack.add({
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/nvim-mini/mini.pairs',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/folke/which-key.nvim',
})

require('ibl').setup() -- indent-blankline

require('lualine').setup()

require('mini.icons').setup()

require('mini.pairs').setup()

require('mini.surround').setup({
    mappings = {
        add = 'gs',
        delete = 'gsd',
        find = '',
        find_left = '',
        highlight = '',
        replace = 'gsr',
    },
})

require('nvim-highlight-colors').setup()

require('which-key').setup({
    spec = {
        { '<Leader>b', group = '[B]uffer', mode = { 'n', 'x' } },
        { '<Leader>g', group = '[G]it', mode = { 'n', 'x' } },
        { '<Leader>s', group = '[S]earch (Telescope)', mode = { 'n' } },
    }
})
