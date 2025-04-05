-- Git related plugins
return { 
    {
        'lewis6991/gitsigns.nvim', -- Adds git related signs to the gutter, as well as utilities for managing changes
        name = 'GitSigns',
        event = 'VeryLazy',
        opts = {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },          
            attach_to_untracked = true,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 300,
            },
        },
    },
}
