return {
    "mbbill/undotree",
    event = "BufEnter",
    config = function()
        local map = require("utils").map
        map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undo Tree" })

        if vim.g.loaded_undotree then
            vim.g.undotree_WindowLayout = 2

            local os_name = jit.os
            if os_name == "Windows" then
                vim.g.undotree_DiffCommand = "FC"
            elseif os_name == "Linux" then
                vim.g.undotree_DiffCommand = "diff"
            end
        end
    end,
}
