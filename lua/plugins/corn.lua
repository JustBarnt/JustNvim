return {
    {
        "RaafatTurki/corn.nvim",
        -- keys = function()
        --     local c_diag = require 'corn'
        --     return {
        --         { "<leader>cd", c_diag.toggle, desc = "Toggle Corn diagnostics" },
        --         { "<leader>cs", c_diag.scope_cycle(), desc = "Cycle Diagnostic Types" }
        --     }
        -- end,
        opts = {
            scope = "file",
            border_style = "rounded",
            blacklisted_modes = { "v", "V", "c" },
            blacklisted_severities = { vim.diagnostic.severity.HINT },
            on_toggle = function(_)
                vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
            end,
        },
        config = function(_, opts)
            local user_config = require "user.config"
            local config = vim.tbl_deep_extend("force", opts, user_config.corn or {})
            vim.diagnostic.config({ virtual_text = false })
            vim.print(vim.inspect(config))
            require("corn").setup(config)
        end,
    },
}
