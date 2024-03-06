local api = vim.api
local M = {}

local vim_options = function(options)
    if options ~= nil then
        for scope, table in pairs(options) do
            for setting, value in pairs(table) do
                vim[scope][setting] = value
            end
        end
    end
end

-- Telescope Find non sveltekit dir
--find_command = vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
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

    vim.notify = require("notify")

    if vim.fn.glob(vim.fn.getcwd() .. "/.svelte-kit"):match('%.svelte%-kit') ~= nil then
        return rg_command
    else
        return fd_command
    end
end

local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local enabled = function(group, opt)
    return group == nil or group[opt] == nil or group[opt] == true
end

local autocmd = function(args)
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

local lsp_hover_debug = function()
    local clients = vim.lsp.get_active_clients()

    for _, client in ipairs(clients) do
        vim.cmd [[redir >> lsp_log.txt]]
        vim.inspect(client)
        local result, err = vim.lsp.buf_request_sync(0, "textDocument/hover", vim.lsp.util.make_position_params(), 1000)
        vim.inspect(result)
    end
end

M.vim_options = vim_options
M.map = map
M.enabled = enabled
M.autocmd = autocmd

return M
