vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakat = " ^I!@*-+;:,./?"
vim.opt.breakindent = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'},{
    pattern = {"*.norg"},
    command = [[
        set conceallevel=3
        set concealcursor=nc
    ]]
})
