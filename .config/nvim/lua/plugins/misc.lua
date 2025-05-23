-- Miscellaneous plugins
return {
    { -- status line
        'nvim-lualine/lualine.nvim',
        name = 'lualine',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    { -- Show pending keybinds
        'folke/which-key.nvim',
        name = 'WhichKey',
        event = 'VeryLazy',
    },
    { -- Indentation guides and highlight
        'lukas-reineke/indent-blankline.nvim',
        name = 'IndentBlankline',
        event = 'VeryLazy',
        main = 'ibl',
        ---@module 'ibl'
        ---@type ibl.config
        opts = {},
    },
    { -- Notification fidget
        'j-hui/fidget.nvim',
        name = 'Fidget',
        opts = {},
    },
    { -- Highlight todo, notes, etc in comments
        'folke/todo-comments.nvim',
        name = 'todo-comments',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        'brenoprata10/nvim-highlight-colors',
        name = 'highlight-colors',
        event = 'VeryLazy',
        opts = {
            render = 'background'
        },
    },
    {
        "sphamba/smear-cursor.nvim",
        name = 'smear-cursor',
        opts = {},
    },
}
