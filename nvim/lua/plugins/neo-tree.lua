-- Browse the file system and other tree like structures
return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        name = 'Neo-tree',
        event = 'VeryLazy',
        branch = 'v3.x',
        dependencies = {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons',
          'MunifTanjim/nui.nvim',
        },
        ---@module 'neo-tree'
        ---@type neotree.Config?
        opts = {},
    }
}
