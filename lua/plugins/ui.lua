local utils = require("core.utils")

return {
    -- Themes
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
                migrations = true
            },
            highlight_groups = require("core.ui.rose-pine").borderless_telescope()
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
            on_highlights = require("core.ui.tokyonight").borderless_telescope,
        },
        config = function(_, opts)
            require("tokyonight").setup(utils.create_spec("tokyonight", opts))
        end,
    },
}
