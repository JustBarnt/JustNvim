local M = {}
local utils = require "core.utils"
local show_hidden = false

function M.filter_show()
    return true
end

function M.filter_hide(fs_entry)
    local exclude = { ".git", "node_modules", "build", ".svelte-kit", ".vscode", ".vs", ".svn", ".npmrc" }
    return not vim.tbl_contains(exclude, fs_entry.name)
end

function M.toggle_hidden_files()
    show_hidden = not show_hidden
    local new_filter = show_hidden and M.filter_hide or M.filter_show
    MiniFiles.refresh({ content = { filter = new_filter } })
end

function M.map_split(buf_id, lhs, direction)
    local rhs = function()
        local cur_line = vim.api.nvim_get_current_line()
        local entry = MiniFiles.get_fs_entry(buf_id)

        vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            if entry and entry.fs_type == "file" then
                vim.cmd.vsplit(entry.path)
            end
        end)
    end

    -- Adding `desc` will result into `show_help` entries
    local desc = "Split " .. direction
    utils.map("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

return M
