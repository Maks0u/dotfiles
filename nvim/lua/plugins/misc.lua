-- Miscellaneous plugins
return {
    { -- Indentation guides and highlight
        'lukas-reineke/indent-blankline.nvim',
        name = 'IndentBlankline',
        event = 'VeryLazy',
        main = 'ibl',
        ---@module 'ibl'
        ---@type ibl.config
        opts = {},
    },
    { -- Show pending keybinds
        'folke/which-key.nvim',
        name = 'WhichKey',
        event = 'VeryLazy'
    }
}
