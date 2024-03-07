return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 10000,
        lazy = false,
        opts = function()
            local pallets = require "user.theme-colors"
            local opts = {
                -- dim_inactive_windows = true,
                bold_vert_split = true,
                extend_background_behind_borders = false,
                disable_background = true,
                enable = {
                    terminal = true,
                    legacy_highlights = true,
                    migrations = true,
                },
                highlight_groups = {
                    ColorColumn = { bg = "rose", blend = 15 },
                    FloatBorder = { bg = "none" },

                    -- Gitsigns
                    GitsignsAdd = { fg = pallets.main.iris },
                    GitsignsDelete = { fg = pallets.main.love },
                    GitsignsChange = { fg = pallets.main.gold },
                    GitsignsUntracked = { fg = pallets.dawn.pine },
                    GitsignsTopdelete = { fg = pallets.dawn.love },
                    GitsignsChangedelete = { fg = pallets.dawn.rose },

                    -- Telescope Start
                    TelescopeBorder = { fg = "overlay", bg = "overlay" },
                    TelescopeNormal = { fg = "subtle", bg = "overlay" },

                    -- Colors The titles for Telescope
                    TelescopeTitle = { fg = "base", bg = "love" },
                    TelescopePromptTitle = { fg = "base", bg = "pine" },
                    TelescopePreviewTitle = { fg = "base", bg = "iris" },

                    -- Colors the Preview window for Telescope
                    TelescopePreviewNormal = { fg = "text", bg = pallets.main.surface },
                    TelescopePreviewBorder = { fg = pallets.main.surface, bg = pallets.main.surface },

                    -- Colors the Prompt window for Telescope
                    TelescopePromptNormal = { fg = "text", bg = "surface" },
                    TelescopePromptBorder = { fg = "surface", bg = "surface" },
                },
            }

            return opts
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 10000,
        lazy = false,
        opts = function()
            local theme = require "tokyonight.colors"
            ---@class Config
            local opts = {
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
                        fg = c.fg_dark
                    }
                    hl.TelescopePreviewBorder = {
                        bg = prompt,
                        fg = prompt
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
            }
            return opts
        end,
    },
}
