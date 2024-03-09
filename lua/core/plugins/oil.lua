return {
    {
        "stevearc/oil.nvim",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
--[[         keys = function()
            local oil = require "oil"
            local map = require("core.utils").map

            map("n", "<leader>de", oil.toggle_float, { desc = "Open Directory in Float" })
            map("n", "<leader>do", oil.open, { desc = "Open Directory" })
        end, ]]
        config = function()
            local config = require("user.plugins.oil").config
            local oil = require "oil"
            local map = require("core.utils").map
            oil.setup(config)

            map("n", "<leader>de", oil.toggle_float, { desc = "Open Directory in Float" })
            map("n", "<leader>do", oil.open, { desc = "Open Directory" })
        end,
    },
}
