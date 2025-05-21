-- Themes
return {
    { 
        'zaldih/themery.nvim',
        name = 'Themery',
        opts = {
            livePreview = true,
            themes = {
                'catppuccin-latte',
                'tokyonight-day',
                'catppuccin-frappe',
                'catppuccin-macchiato',
                'catppuccin-mocha',
                'tokyonight-storm',
                'tokyonight-moon',
                'tokyonight-night',
            },
        }
    },
    {
        'catppuccin/nvim',
        name = 'Catppuccin',
        priority = 1000,
        opts = {
            transparent_background = true,
        },
    },
    {
        'folke/tokyonight.nvim',
        name = 'TokyoNight',
        priority = 1000,
    },
}
