local M = {}
local components = require "user.plugins.lualine.lualine_components"
local moon = require("user.theme-colors").moon

M.config = {
    options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = "rose-pine",
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
                color = { fg = moon.base, bg = moon.love },
                separator = { right = "" },
            },
            {
                "diff",
                color = { fg = moon.base, bg = moon.highlight_high },
                separator = { right = "" },
            },
            {
                "diagnostics",
                sources = { "nvim_lsp", "nvim_diagnostic" },
                sections = { "error", "warn", "info" },
                color = { fg = moon.base, bg = moon.highlight_med },
                separator = { right = "" },
                always_visible = true,
            },
            {
                components.harpoon_component,
                color = { fg = moon.text, bg = moon.highlight_low },
                separator = { right = "" },
            },
        },
        lualine_c = {
            {
                "searchcount",
                color = { fg = moon.text, bg = moon.iris },
                separator = { right = "" },
            },
        },
        lualine_x = {
            {
                "datetime",
                icon = "",
                style = "%H:%M",
                color = { fg = moon.text, bg = moon.highlight_med },
                separator = { left = "" },
            },
        },
        lualine_y = {
            {
                "filetype",
                colored = false,
                color = { fg = moon.text, bg = moon.highlight_high },
                separator = { left = "" },
            },
        },
        lualine_z = {
            {
                "location",
                icon = "",
                color = { fg = moon.base, bg = moon.love },
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
