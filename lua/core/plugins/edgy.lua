local utils = require "utils"

return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
        animate = {
            enabled = false,
        },
        exit_when_last = true,
        bottom = {
            -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
            {
                ft = "toggleterm",
                size = { height = 0.4 },
                -- exclude floating windows
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
        left = {
            -- {
            --     ft = "oil",
            --     title = "File Explorer",
            --     size = { height = 0.3 },
            --     filter = function(buf)
            --         return vim.bo[buf].buftype == "acwrite"
            --     end,
            -- },
        },
    },
    config = function(_, opts)
        require("edgy").setup(utils.create_spec("edgy", opts))
    end,
}
