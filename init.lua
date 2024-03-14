-- Mapleader should be set as quick as possible. There is no reason to not set it at the very top of your initial init.lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has("win32") then
    local ori_fnameescape = vim.fn.fnameescape
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.fn.fnameescape = function(...)
        local result = ori_fnameescape(...)
        return result:gsub("\\", "/")
    end
end

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
