vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    -- 'https://github.com/hrsh7th/nvim-cmp',
    -- 'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp',
})

-- vim.opt.autocomplete = true
-- vim.opt.pumborder = 'rounded'
-- vim.opt.completeopt = 'menu,menuone,noselect,nearest'

vim.keymap.set('', '<Leader>lf', function()
    vim.lsp.buf.format()
end, { desc = 'Format file' })

require('mason').setup()

-- Completion plugin

-- require('cmp').setup({
--     sources = {
--         { name = 'nvim_lsp' },
--     },
-- })

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    -- keymap = {
    --     preset = 'none',
    --     ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    --     ['<C-y>'] = { 'select_and_accept', 'fallback' },
    --     ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    --     ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    --     ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    --     ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    --     ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    -- },
    keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'select_next', 'accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
    },
    completion = {
        ghost_text = { enabled = true, show_with_menu = true },
        menu = { auto_show = false },
    },
})



-- LSP configs

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    -- capabilities = capabilities,
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

vim.lsp.enable({ 'lua_ls' })
