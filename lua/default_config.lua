---@Class JustNvimConfig
local M = {}

---@type { [string]: string}
M.servers = {}

---@class Formatters
---@field formatters_by_ft table<string, string>
M.formatters = { ensure_installed = {}, formatters_by_ft = {} }

---@class TSConfig
M.treesitter = {}

---@class TelescopeConfig
---@field defaults table
---@field pickers table
---@field extensions table
M.telescope = {}

M.plugins = {}

---@class JustNvimOptOuts
---@field plugins  {[string]: boolean}
---@field commands {[string]: boolean}
---@field autocmds {[string]: boolean}
M.opt_out = {
    plugins = { },
    commands = { },
    autocmds = {
        ["trailing_whitespace_on_save"] = false,
        ["format_on_save"] = false,
    },
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
