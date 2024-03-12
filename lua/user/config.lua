-- TODO: Create a separate class in a file that can just be imported instead of all of it being defined here
local M = {}

---@type string[]
M.ensure_installed = {}

---@type { [string]: string}
M.servers = {}

---@class Formatters
---@field formatters_by_ft table<string, string>
M.formatters = { formatters_by_ft = {} }

---@class TSConfig
M.treesitter = {}

---@class TelescopeConfig
---@field defaults table
---@field pickers table
---@field extensions table
M.telescope = {}

---@class JustNvimOptIns
---@field plugins {[string]: boolean|table}
---@field commands {[string]: boolean}
---@field autocmds {[string]: boolean}
M.opt_in = {
    plugins = {
        ["neodev"] = true,
        ["neoconf"] = true,
    },
    commands = {
        ["quit_all"] = true,
        ["format"] = true,
        ["telescope_highlight_tags"] = true,
        ["harlequin"] = true
    },
    autocmds = {
        ["disable_auto_comment"] = false,
        ["dashboard_start"] = true,
        ["help_in_float"] = true,
        ["highlight_yank"] = true,
        ["cursor_line"] = true,
        ["cursor_line_control"] = true,
        ["trailing_whitespace"] = false,
        ["show_message_float"] = true,
    }
}

---@class JustNvimUserOptions
---@field opt vim.opt
---@field bo vim.bo
---@field wo vim.wo

---@type JustNvimUserOptions
M.user_options = {
    opt = {},
    bo = {},
    wo = {},
}

return M
