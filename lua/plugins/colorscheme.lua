local user_config = require("user.config")

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 10000,
        lazy = false,
        opts = {},
        config = function(_, opts)
            local theme = require('rose-pine')
            local config = vim.tbl_deep_extend("force", opts, user_config.rosepine or {})

            theme.setup(config)
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            on_highlights = function(hl, c)
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }

                -- Prompt
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = prompt,
                    fg = c.fg_dark,
                }
                -- Preview
                hl.TelescopePreviewNormal = {
                    bg = prompt,
                    fg = c.fg_dark,
                }
                hl.TelescopePreviewBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = prompt,
                    fg = c.fg_dark,
                }
                -- Results
                hl.TelescopeResultsTitle = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
            end,
        },
        config = function(_, opts)
            local theme = require "tokyonight"
            local config = vim.tbl_deep_extend("force", opts, user_config.tokyonight or {})

            theme.setup(config)
        end,
    },
}
