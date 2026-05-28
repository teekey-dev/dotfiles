-- Remove Trailing empty lines
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*" },
    callback = function()
        local current_postiion = vim.fn.getpos('.')
        local current_view = vim.fn.winsaveview()
        local linecount = vim.fn.line('$')
        while linecount > 1 and string.find(vim.fn.getline(linecount), '^%s*$') do
            vim.fn.execute(tostring(linecount) .. 'delete')
            linecount = linecount - 1
        end
        vim.fn.winrestview(current_view)
        vim.fn.setpos('.', current_postiion)
    end
})

-- Remove trailing whitespaces
_G.trim_enabled = true

function TrimEnable()
    _G.trim_enabled = true
    print('Trailing whitespaces will be removed on save')
end

function TrimDisable()
    _G.trim_enabled = false
    print('Trailing whitespaces will not be removed on save')
end

function TrimWhitespace()
    if _G.trim_enabled and vim.bo.filetype ~= 'markdown' and vim.bo.filetype ~= 'text' then
        vim.fn.execute('%s/\\s\\+$//e')
    end
end

vim.api.nvim_exec([[
    command! TrimEnable lua TrimEnable()
    command! TrimDisable lua TrimDisable()
]], false)

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*" },
    callback = TrimWhitespace
})
