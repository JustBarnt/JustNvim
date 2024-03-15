local api = vim.api
local M = {}

--- Applies all values to `vim.[scope][setting]`
---@param options table A Table of options to pass to it
function M.vim_options(options)
    if options ~= nil then
        for scope, table in pairs(options) do
            for setting, value in pairs(table) do
                vim[scope][setting] = value
            end
        end
    end
end


--- Returns true if the buffer is large than X size
---@param bufnr integer The buffer to check
---@param size integer The max size allowed in bytes
---@return boolean
function M.is_large_buffer(bufnr, size)
    local is_large_buf = false
    local max_filesize = size * 1024
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max_filesize then
        is_large_buf = true
    end

    return is_large_buf
end

--- Returns the users plugin spec from `user.config` or an empty table if it is not defined in the `user.config`
---@param plugin_name string the name of the plugin to search for in `user.config`
---@param opts table the default opts used by the plugin
function M.create_spec(plugin_name, opts)
    local user_config = require('user.config') or {}
    return vim.tbl_deep_extend("force", opts, user_config.opt_in.plugins[plugin_name] or {})
end

--- Sets the Telescope find_files picker to RipGrep on windows if
--- the user is on windows
function M.select_find_command()
    local rg_command = {
        initial_mode = "insert",
        hidden = true,
        find_command = {
            "rg",
            "--files",
            "--color=never",
            "--no-heading",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob",
            "!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
            "--path-separator",
            "/",
        },
    }

    local fd_command = {
        initial_mode = "insert",
        find_command = vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
    }

    if vim.fn.glob(vim.fn.getcwd() .. "/.svelte-kit"):match "%.svelte%-kit" ~= nil then
        return rg_command
    else
        return fd_command
    end
end

--- Wrapper for `vim.keymap.set`
---@param mode string Mode the keymap can work in
---@param lhs string The left hand side AKA: Key combination to activate
---@param rhs string|function The right hand side AKA: The action to invoke
---@param opts? table A table of options the `vim.keymap.set` supports
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

--- Returns true if the group either doesn't exist in the table of the value is true
--- Simulates opt-out functionality (TODO: Make Opt-IN instead)
---@param group table A key to a table of available modules to opt in or out of
---@param opt string Augroup or plugin to disable
---@return boolean
function M.enabled(group, opt)
    return group == nil or group[opt] == nil or group[opt] == true
end

--- Simpler autocmd function call
---@param args table A table of args matching the `vim.api.nvim_create_autocmd` signature
function M.autocmd(args)
    local event = args[1]
    local group = args[2]
    local callback = args[3]

    vim.api.nvim_create_autocmd(event, {
        group = group,
        buffer = args[4],
        callback = function()
            callback()
        end,
        once = args.once,
    })
end

return M

