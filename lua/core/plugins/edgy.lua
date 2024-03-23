local utils = require "core.utils"

return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
        ---@type(Edgy.View.Opts|string)[]
        top = {},
        ---@type(Edgy.View.Opts|string)[]
        bottom = {
            {
                ft = "toggleterm",
                size = { height = 0.4 },
                filter = function(_, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            {
                ft = "Trouble",
                size = { height = 0.4 },
            },
            {
                ft = "bmessages",
                size = { height = 0.4 },
            },
            { ft = "qf", title = "QuickFix" },
        },
        ---@type(Edgy.View.Opts|string)[]
        left = {
            {
                title = "Neo-Tree",
                ft = "neo-tree",
                size = { height = 0.5 },
            },
        },
        ---@type(Edgy.View.Opts|string)[]
        right = {},
    },
    config = function(_, opts)
        require("edgy").setup(utils.create_spec("edgy", opts))
    end,
}
