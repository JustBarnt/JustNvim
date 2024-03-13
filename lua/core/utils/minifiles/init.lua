local M = {}
local show_hidden = false

function M.filter_show() return true end

function M.filter_hide(fs_entry)
    local exclude = { ".git", "node_modules", "build", ".svelte-kit", '.vscode', '.vs', '.svn', '.npmrc' }
    return not vim.tbl_contains(exclude, fs_entry.name)
end

function M.toggle_hidden_files()
    show_hidden = not show_hidden
    local new_filter = show_hidden and M.filter_hide or M.filter_show
    MiniFiles.refresh({ content = { filter = new_filter }})
end

return M
