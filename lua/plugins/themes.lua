local utils = require "core.utils"

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 10000,
        lazy = false,
        opts = {
            bold_vert_split = true,
            extend_background_behind_borders = false,
            disable_background = true,
            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true,
            },
            highlight_groups = require("core.ui.rose-pine").borderless_telescope(),
        },
        config = function(_, opts)
            require("rose-pine").setup(utils.create_spec("rose_pine", opts))
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            styles = {
                functions = { bold = true },
                keywords = { bold = true },
                floats = "transparent",
            },
            on_highlights = function(highlights, colors)
                local tokyonight_overrides = require "core.ui.tokyonight"
                tokyonight_overrides.borderless_float(highlights, colors)
                tokyonight_overrides.borderless_telescope(highlights, colors)
                tokyonight_overrides.ui_blend(highlights, colors)
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(utils.create_spec("tokyonight", opts))
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            overrides = function(colors)
                local overrides = require "core.ui.kanagawa"
                return vim.tbl_deep_extend(
                    "force",
                    {},
                    overrides.borderless_float(colors),
                    overrides.borderless_telescope(colors)
                )
            end,
        },
        config = function(_, opts)
            require("kanagawa").setup(utils.create_spec("kanagawa", opts))
        end,
    },
    {
        "b0o/lavi.nvim",
        lazy = false,
        priority = 10000,
    },
}
