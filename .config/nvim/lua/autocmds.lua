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

autocmd('BufReadPost', {
    desc = 'Resume editing',
    group = create_augroup('cursor.resume'),
    pattern = '*',
    callback = function(event)
        -- local exclude = { 'gitcommit' } -- don't remember position in commit messages
        local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end,
})

-- autocmd('LspAttach', {
--     group = create_augroup('lsp'),
--     callback = function(event)
--         local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
--
--         -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
--         end
--     end,
-- })
