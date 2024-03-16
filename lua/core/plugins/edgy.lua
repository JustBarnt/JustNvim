return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
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
            {
                title = "File Explorer",
                ft = "neo-tree",
                pinned = true,
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.4 },
            },
        },
    },
}
