vim.pack.add({
    'https://github.com/stevearc/conform.nvim',
})

local biome_or_prettier = { 'biome-check', 'prettier', stop_after_first = true }

require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        javascript = biome_or_prettier,
        typescript = biome_or_prettier,
        json = biome_or_prettier,
        markdown = { 'prettier' },
        yaml = { 'prettier' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
    },
})

vim.keymap.set('n', '<Leader>f', function()
    require('conform').format({ async = true, lsp_fallback = true })
end, { desc = '[F]ormat' })
