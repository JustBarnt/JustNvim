return {
    "mbbill/undotree",
    event = "BufEnter",
    config = function()
        local map = require("utils").map
        map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undo Tree" })
    end,
}
