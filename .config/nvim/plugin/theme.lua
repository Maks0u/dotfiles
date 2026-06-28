vim.pack.add({
    'https://github.com/catppuccin/nvim',
})

require('catppuccin').setup({
    flavour = 'frappe',
    transparent_background = true,
    float = {
        transparent = true,
    },
    auto_integrations = true,
})

vim.cmd.colorscheme('catppuccin')
