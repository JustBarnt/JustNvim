return {
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.10.0",
        cmd = "ToggleTerm",
        opts = {},
        keys = function()
            local lazyterm = require "core.utils.terminal"
            return {
                {"<leader>lg", lazyterm.lazygit_toggle, { desc = "Toggle Lazygit" }}
            }
        end,
        config = function(_, opts)
            local map = require("core.utils").map
            local toggleterm = require "toggleterm"

            -- map("n", "<leader>lg", lazyterm.lazygit_toggle, { desc = "Toggle Lazygit" })
            toggleterm.setup(opts)
        end,
    },
}
