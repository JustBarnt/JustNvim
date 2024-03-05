return {
    "stevearc/dressing.nvim",
    opts = {
        input = {
            title_pos = "center",

        },
        select = {
            backend = {
                "telescope",
                "nui",
                "builtin"
            },
            telescope = require('telescope.themes').get_dropdown({ initial_mode = "normal" }),
        }
    }
}
