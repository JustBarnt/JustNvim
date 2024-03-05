return {
    "stevearc/dressing.nvim",
    config = function()
        require("dressing").setup({
            input = {
                title_pos = "center",
            },
            select = {
                backend = {
                    "telescope",
                    "nui",
                    "builtin",
                },
                telescope = require("telescope.themes").get_dropdown({ initial_mode = "normal" }),
            },
        })
    end,
}
