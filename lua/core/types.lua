---@class JustNvimConfig
---@field servers? table<string, string> List of Language Servers to install
---@field formatters? JustNvimFormatters List of Formatters to install and formatters to use for file types
---@field treesitter? TSConfig Configuration table for Treesitter. Accepts options from `nvim-treesitter.configs`
---@field telescope? JustNvimTelescope Configuration table for `nvim-telescope`
---@field plugins? table<string, table> Configuration table for a plugin.
---@field features? JustNvimFeatures Configuration tables of plugins, commands, and autocmds to disable or enable
---@field options? JustNvimOptions Configuration table of Vim options to override

---@class JustNvimFormatters
---@field ensure_installed string[]
---@field formatters_by_ft table<string, string[]|string|string[][]>

---@class JustNvimTelescope
---@field defaults table Default configuration for telescope `:h telescope.defaults`
---@field pickers table Configuration for telescope pickers: `:h telescope.pickers`
---@field extensions table Configuration for telescope extensions: `:h telescope.extensions`

---@class JustNvimFeatures
---@field plugins {[string]: boolean} Table containing a key value pair of plugins to disiable
---@field commands {[string]: boolean} Table containing a key value pair of commands to disable
---@field autocmds {[string]: boolean} Table containing a key value pair of autocmds to disable

---@class JustNvimOptions
---@field opt vim.opt Vim options
