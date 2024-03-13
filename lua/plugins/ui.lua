local utils = require "core.utils"

return {
    -- Themes
    -- Rose-pine
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
    -- Tokyonight
    {
        "folke/tokyonight.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            on_highlights = require("core.ui.tokyonight").borderless_telescope,
        },
        config = function(_, opts)
            require("tokyonight").setup(utils.create_spec("tokyonight", opts))
        end,
    },
    --UI Altering
    -- Detour
    {
        "carbon-steel/detour.nvim",
    },
    -- Dressing
    {
        "stevearc/dressing.nvim",
        opts = {
            input = {
                title_pos = "center",
            },
            select = {
                backend = {
                    "telescope",
                    "nui",
                    "builtin"
                },
                telescope = require("telescope.themes").get_dropdown({initial_mode = "normal"})
            }
        },
        config = function(_, opts)
            require("dressing").setup(utils.create_spec("dressing", opts))
        end,
    },
}
