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
        event = 'VeryLazy',
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
        opts = { signs = false }
    },
}
