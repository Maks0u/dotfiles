-- [[ Autocmds ]]

local autocmd = vim.api.nvim_create_autocmd

local function create_augroup(name)
    return vim.api.nvim_create_augroup('user.' .. name, { clear = true })
end

autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = create_augroup('yank.hl'),
    pattern = '*',
    callback = function()
        vim.hl.on_yank({ timeout = 150 })
    end,
})

-- autocmd('BufEnter', {
--     desc = 'Remove search highlight',
--     group = create_augroup('noh'),
--     pattern = '*',
--     callback = function(event)
--         require('fidget').notify('EVENT: ' .. event.event)
--         vim.cmd('nohlsearch')
--     end,
-- })

autocmd('BufReadPost', {
    desc = 'Resume editing',
    group = create_augroup('cursor.resume'),
    pattern = '*',
    callback = function(event)
        local mark = vim.api.nvim_buf_get_mark(event.buf, '.')
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end,
})

autocmd('LspAttach', {
    group = create_augroup('lsp'),
    callback = function(event)
        local map = function(keys, fn, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, fn, { buffer = event.buf, desc = desc })
        end

        map('<Leader>f', vim.lsp.buf.format, '[F]ormat')
        map('<Leader>rn', vim.lsp.buf.rename, '[R]ename')
        map('gd', vim.lsp.buf.definition, 'Go to [d]efinition')
        map('gD', vim.lsp.buf.declaration, 'Go to [D]eclaration')
        map('gi', vim.lsp.buf.implementation, 'Go to [i]mplementation')
        map('gr', vim.lsp.buf.references, 'Go to [r]eferences')
        map('<Leader>h', vim.lsp.buf.hover, '[H]over')
    end,
})
