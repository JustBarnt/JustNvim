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

---@class JustNvimOptIns
---@field plugins  {[string]: boolean}
---@field commands {[string]: boolean}
---@field autocmds {[string]: boolean}
M.opt_in = {
    plugins = {
        -- Some plugins, commands, and autocommands are opt-out instead of opt-in
        -- because I feel like they add value to the User Experience
        ["neodev"] = true,
        ["neoconf"] = true,
        ["mini.files"] = true,
        ["mini.align"] = true,
        ["mini.cursorword"] = true,
        ["mini.indentscope"] = true,
        ["mini.misc"] = true,
        ["mini.move"] = true,
        ["mini.operators"] = true,
        ["mini.pairs"] = true,
        ["mini.splitjoin"] = true,
        ["mini.surround"] = true,
        ["Comment"] = true,
        ["bmessages"] = true,
        ["ccc"] = true,
        ["cd-project"] = true,
        ["detour"] = true,
        ["gitsigns"] = true,
        ["global-note"] = true,
        ["harpoon"] = true,
        ["inc-rename"] = true,
        ["lualine"] = true,
        ["mini.jump"] = true,
        ["neogen"] = true,
        ["neoscroll"] = true,
        ["nerdy"] = true,
        ["nvim-cheatsh"] = true,
        ["nvim-highlight-colors"] = true,
        ["pomo"] = true,
        ["todo-comments"] = true,
        ["trouble"] = true,
        ["ts-error-translator"] = true,
        ["vim-apm"] = true,
        ["vim-sleuth"] = true,
    },
    commands = {
        ["format"] = true,
        ["show_message_float"] = true,
        ["quit_all"] = true,
    },
    autocmds = {
        ["disable_auto_comment"] = true,
        ["highlight_yank"] = true,
        ["help_in_float"] = true,
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
