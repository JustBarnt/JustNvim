return {
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.10.0",
        opts = {
            shade_terminals = false,
        },
        keys = function()
            local lazyterm = require "core.utils.terminal"
            return {
                { "<leader>lg", lazyterm.lazygit_toggle, { desc = "Toggle Lazygit" } },
                { "<leader>tt", "<CMD>EdgyTerm<CR>", { desc = "Toggle Terminal" } },
            }
        end,
        config = function(_, opts)
            local toggleterm = require "toggleterm"
            toggleterm.setup(opts)
        end,
    },
}
