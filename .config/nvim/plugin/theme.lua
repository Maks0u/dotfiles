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
    -- integrations = {
    --     dropbar = {
    --         enabled = true,
    --         color_mode = true,
    --     },
    -- },
})

vim.cmd.colorscheme('catppuccin')
