local utils = require "core.utils"


return {
    {
        "utilyre/barbecue.nvim",
        event = "BufEnter",
        name = "barbecue",
        enabled = utils.enabled("plugins", 'barbecue'),
        dependencies = {
            "SmiteshP/nvim-navic"
        },
        opts = {
            show_dir_name = false,
            attach_navic = false, -- prevent barbecue from attaching navic as it can only attach
                                  -- to one lsp at a time so js projects that have ts, htlm, css, etc.
                                  -- will give a warning
        },
        config = function(_, opts)
            require("barbecue").setup(utils.create_spec("barbecue", opts))
        end,
    },
    {
        "uga-rosa/ccc.nvim",
        enabled = utils.enabled("plugins", "ccc"),
        cmd = { "CccPick", "CccConvert" },
        keys = {
            { "<leader>cp", "<CMD>CccPick<CR>", desc = "Open Color Picker" },
            { "<leader>cc", "<CMD>CccConvert<CR>", desc = "Convert Color Under Cursor" },
        },
        opts = {
            highlighter = {
                auto_enable = false,
                lsp = false,
            },
        },
        config = function(_, opts)
            require("ccc").setup(utils.create_spec("ccc", opts))
        end,
    },
    {
        "carbon-steel/detour.nvim",
        enabled = utils.enabled("plugins", "detour"),
    },
    {
        "lewis6991/gitsigns.nvim",
        enabled = utils.enabled("plugins", "gitsigns"),
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
    {
        "nvim-lualine/lualine.nvim",
        enabled = utils.enabled("plugins", "lualine"),
        event = "ColorScheme",
        opts = function()
            local components = require "plugins.components.lualine_components"
            return {
                options = {

                    theme = vim.g.colors_name,
                    globalstatus = true,
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
    {
        "mvllow/modes.nvim",
        event = "BufEnter",
        tag = "v0.2.0",
        opts = function()
            local get_hl = vim.api.nvim_get_hl

            return {
                colors = {
                    delete = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.error" }).fg),
                    copy = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.warning" }).fg),
                    insert = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.todo" }).fg),
                    visual = utils.get_rbg_from_hl(get_hl(0, { name = "@comment.info" }).fg),
                },

                -- Set opacity for cursorline and number background
                line_opacity = 0.15,

                -- Enable cursor highlights
                set_cursor = false,

                -- Enable cursorline initially, and disable cursorline for inactive windows
                -- or ignored filetypes
                set_cursorline = true,

                -- Enable line number highlights to match cursorline
                set_number = true,

                -- Disable modes highlights in specified filetypes
                -- Please PR commonly ignored filetypes
                ignore_filetypes = { "NvimTree", "TelescopePrompt" },
            }
        end,
        config = function(_, opts)
            require("modes").setup(utils.create_spec("modes", opts))
        end,
    },
    {
        "2kabhishek/nerdy.nvim",
        enabled = utils.enabled("plugins", "nerdy"),
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Nerdy",
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
} ---@type LazySpec[]
