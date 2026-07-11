vim.pack.add({
    'https://github.com/stevearc/conform.nvim',
})

local biome_or_prettier = { 'biome-check', 'prettier', stop_after_first = true }

require('conform').setup({
    formatters_by_ft = {
        bash = { 'shfmt' },
        javascript = biome_or_prettier,
        json = biome_or_prettier,
        lua = { 'stylua' },
        markdown = { 'prettier' },
        sh = { 'shfmt' },
        typescript = biome_or_prettier,
        yaml = { 'prettier' },
        zsh = { 'shfmt' },
    },
})

vim.keymap.set('n', '<Leader>f', function()
    require('conform').format({ async = true, lsp_fallback = true })
end, { desc = '[F]ormat' })
