return {
    "mbbill/undotree",
    event = "BufEnter",
    config = function()
        local map = require("core.utils").map
        map("n", "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "Undo Tree" })
    end,
}
