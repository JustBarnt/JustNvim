-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if not vim.g.vscode then
    require "core"
    if vim.g.loaded_undotree then
        vim.g.undotree_WindowLayout = 2

        local os_name = jit.os
        if os_name == 'Windows' then
            vim.g.undotree_DiffCommand="FC"
        elseif os_name == 'Linux' then
            vim.g.undotree_DiffCommand="diff"
        end
    end
else
    require("core.keymaps").Default()
end
