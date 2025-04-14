return {
    { -- file explorer
        'stevearc/oil.nvim',
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        ---@module 'oil'
        ---@type oil.SetupOpts
        -- opts = {}
        ---@diagnostic disable-next-line
        config = function()
            require('oil').setup({
                view_options = {
                    case_insensitive = true,
                    show_hidden = true,
                },
                use_default_keymaps = false,
                keymaps = {
                    ["?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                    ["<C-t>"] = { "actions.select", opts = { tab = true } },
                    ["p"] = "actions.preview",
                    ["q"] = { "actions.close", mode = "n" },
                    ["<F5>"] = "actions.refresh",
                    ["<BS>"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["`"] = { "actions.cd", mode = "n" },
                    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                    ["gs"] = { "actions.change_sort", mode = "n" },
                    ["gx"] = "actions.open_external",
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                    ["g\\"] = { "actions.toggle_trash", mode = "n" },
                },
            })

            -- Use '\' to toggle file explorer
            vim.keymap.set('n', '\\', function()
                require('oil').toggle_float()
            end, { desc = 'Toggle Oil floating window' })
        end
    },
}
