vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',          -- Provide default configurations
    'https://github.com/mason-org/mason.nvim',           -- Install lsp executables
    'https://github.com/mason-org/mason-lspconfig.nvim', -- Brings everything together
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user.lsp', { clear = true }),
    callback = function(event)
        local map = function(keys, fn, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, fn, { buffer = event.buf, desc = desc })
        end

        map('gD', vim.lsp.buf.declaration, 'Go to [D]eclaration')
        map('gd', vim.lsp.buf.definition, 'Go to [d]efinition')
        map('gi', vim.lsp.buf.implementation, 'Go to [i]mplementation')
        map('gr', vim.lsp.buf.references, 'Go to [r]eferences')
        map('<Leader>rn', vim.lsp.buf.rename, '[R]ename')
        map('<Leader>h', vim.lsp.buf.hover, '[H]over')
        map('<Leader>ca', vim.lsp.buf.code_action, '[C]ode [a]ction')
    end,
})

vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '${3rd}/luv/library',
                    '${3rd}/busted/library',
                },
            },
        },
    },
})

require('mason').setup()
require('mason-lspconfig').setup({
    automatic_enable = true, -- will automatically enable `vim.lsp.enable()` installed servers
    ensure_installed = { 'cssls', 'html', 'lua_ls', 'stylua', 'ts_ls' },
})
