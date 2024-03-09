local M = {}

--- CORE SETTINGS ---
-- LSP Settings
M.ensure_installed = { }
M.servers = { }
M.formatters = { }

---@class  TSConfig
M.treesitter = {}

M.telescope = {}



-- User options for Neovim
M.user_options = {
    opt = {
        -- Editor / Command options
        number = true,
        relativenumber = true,
        scrolloff = 10, -- Amount of lines below curor
        pumblend = 17,
    },
}

-- User Commands to opt into
M.user_commands = {
    quit_all = true,
    format = true,
    telescope_highlight_tags = true,
}

-- Auto commands to opt into
M.autocmds = {
    --TODO: Add keybind that disables and enables this
    disable_auto_comment = false,
    dashboard_start = true,
    help_in_float = true,
    highlight_yank = true,
    cursor_line = true,
    cursor_line_control = true,
    trailing_whitespace = false,
    show_message_float = true,
}

--- PLUGIN SETTINGS ---

M.harpoon = {
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
}


M.neoscroll = {
    respect_scrolloff = true,
}

return M
