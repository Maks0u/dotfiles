vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
})

require('mason').setup()

vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
        },
    },
})

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript' },
    root_markers = { 'package.json' },
})

-- vim.lsp.config('shellcheck', {
--     cmd = { 'shellcheck', '-', '--enable=all', '--format=json' },
--     filetypes = { 'bash', 'sh', 'zsh' },
-- })

vim.lsp.enable({
    'lua_ls',
    'ts_ls',
})
