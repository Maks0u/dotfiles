vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
})

local vimgrep_arguments = { unpack(require('telescope.config').values.vimgrep_arguments) }
table.insert(vimgrep_arguments, '--hidden')
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')

require('telescope').setup({
    defaults = {
        layout_config = { anchor = 'S', height = 0.3, width = 140 },
        layout_strategy = 'center',
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
        },
    },
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require('telescope.builtin')

local nvim_config_files = function()
    builtin.find_files({ cwd = vim.fn.stdpath('config') })
end

vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[G]rep' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
vim.keymap.set('n', '<leader>sn', nvim_config_files, { desc = '[N]vim config files' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[.] Recent Files' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Buffers' })
