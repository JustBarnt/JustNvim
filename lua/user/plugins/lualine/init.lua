local M = {}
local components = require "user.plugins.lualine.lualine_components"

M.config = {
    options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = vim.g.colors_name,
        globalstatus = true,
        -- section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {
            {
                components.pomodoro_component
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
                    newfile = ""
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

return M
