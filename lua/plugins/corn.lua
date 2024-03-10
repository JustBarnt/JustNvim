return {
    {
        "RaafatTurki/corn.nvim",
        opts = {
            scope = "line",
            border_style = "rounded",
            blacklisted_modes = { "v", "V", "c" },
            blacklisted_severities = { vim.diagnostic.severity.HINT },
            on_toggle = function(_)
                vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
            end,
        },
        config = function(_, opts)
            local map = require("core.utils").map
            local user_config = require "user.config"
            local config = vim.tbl_deep_extend("force", opts, user_config.corn or {})
            vim.diagnostic.config({ virtual_text = false })

            map("n", "<leader>cd", "<CMD>Corn toggle", { desc = "Toggle Corner Diagnostics " })
            map("n", "<leader>cs", "<CMD>Corn scope_cycle", { desc = "Cycle Corner Diagnostics Scope" })
            require("corn").setup(config)
        end,
    },
}
