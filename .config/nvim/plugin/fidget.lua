vim.pack.add({
    'https://github.com/j-hui/fidget.nvim',
})

require('fidget').setup()

vim.notify = require('fidget').notify

vim.keymap.set('n', '<Leader>n', '<cmd>Fidget history<CR>', { desc = '[N]otification history' })
vim.keymap.set('n', '<Leader>N', '<cmd>Telescope fidget<CR>', { desc = 'Telescope [N]otification history' })
