return {
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.10.0",
        cmd = "ToggleTerm",
        keys = function()
            local lazygit = require 'core.plugins.terminal.init'.lazygit_toggle

            return {
                {"<leader>lg", lazygit, desc = "Toggle Lazygit" }
            }
        end,
        opts = {},
        config = function(_, opts)
            local toggleterm = require('toggleterm')

            toggleterm.setup(opts)
        end,
    },
} 
