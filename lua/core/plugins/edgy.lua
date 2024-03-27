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
        ---@type(edgy.view.opts|string)[]
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
            { ft = "spectre_panel", size = { height = 0.4 } },
        },
        ---@type(Edgy.View.Opts|string)[]
        left = {
            {
                title = "Neo-Tree",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.5 },
            },
            {
                ft = "Outline",
                title = "Document Symbols",
                pinned = true,
                open = "OutlineOpen",
            },
        },
        ---@type(Edgy.View.Opts|string)[]
        right = {},
    },
    config = function(_, opts)
        require("edgy").setup(utils.create_spec("edgy", opts))
    end,
}
