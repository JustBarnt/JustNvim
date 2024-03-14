local utils = require "utils"

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
    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        priority = 10000,
        lazy = false,
        opts = {
            overrides = function(colors)
                local overrides = require "core.ui.kanagawa"
                return vim.tbl_deep_extend("force", {}, overrides.borderless_float(colors), overrides.borderless_telescope(colors))
            end,
        },
        config = function(_, opts)
            require("kanagawa").setup(utils.create_spec("kanagawa", opts))
        end
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
                    "builtin",
                },
                telescope = require("telescope.themes").get_dropdown({ initial_mode = "normal" }),
            },
        },
        config = function(_, opts)
            require("dressing").setup(utils.create_spec("dressing", opts))
        end,
    },
    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "|" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "|" },
            },
        },
        config = function(_, opts)
            require("gitsigns").setup(utils.create_spec("gitsigns", opts))
        end,
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "ColorScheme",
        opts = function()
            local components = require "components.lualine_components"
            return {
                options = {
                    --- @usage 'rose-pine' | 'rose-pine-alt'
                    theme = vim.g.colors_name,
                    globalstatus = true,
                    -- section_separators = { left = '', right = ''},
                },
                sections = {
                    lualine_a = {
                        {
                            components.pomodoro_component,
                        },
                        {
                            "filename",
                            file_statue = true,
                            path = 1,
                            use_mode_colors = true,
                            symbols = {
                                modified = "",
                                read_only = "",
                                unnamed = "󰂾",
                                newfile = "",
                            },
                        },
                    },
                    lualine_b = {
                        {
                            "branch",
                            icon = "",
                            separator = { right = "" },
                        },
                        {
                            "diff",
                            separator = { right = "" },
                        },
                        {
                            "diagnostics",
                            sources = { "nvim_lsp", "nvim_diagnostic" },
                            sections = { "error", "warn", "info" },
                            separator = { right = "" },
                            always_visible = true,
                        },
                        {
                            components.harpoon_component,
                            separator = { right = "" },
                        },
                    },
                    lualine_c = {
                        {
                            "searchcount",
                            separator = { right = "" },
                        },
                    },
                    lualine_x = {
                        {
                            "datetime",
                            icon = "",
                            style = "%H:%M",
                            separator = { left = "" },
                        },
                    },
                    lualine_y = {
                        {
                            "filetype",
                            colored = false,
                            separator = { left = "" },
                        },
                    },
                    lualine_z = {
                        {
                            "location",
                            icon = "",
                            separator = { left = "" },
                        },
                        {
                            "mode",
                            icon = "",
                            separator = { left = "" },
                        },
                    },
                },
            }
        end,

        config = function(_, opts)
            require("lualine").setup(utils.create_spec("lualine", opts))
        end,
    },
    -- nerdy
    {
        "2kabhishek/nerdy.nvim",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Nerdy",
    },
    -- nvim-web-devicons
    {
        "nvim-tree/nvim-web-devicons",
    },
}
