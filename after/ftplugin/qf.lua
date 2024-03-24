vim.api.nvim_create_autocmd("BufWinEnter", {
    desc = "Swaps default quickfix window for troubles",
    callback = function()
        local ok, trouble = pcall(require, 'trouble')
        if ok then
            vim.defer_fn(function()
                vim.cmd('cclose')
                trouble.open('quickfix')
            end, 0)
        end
    end,
})
