local M = {}

-- TODO: Keep Buffer out of regular completion only enable it in
-- comments or md, help, txt , norg

local types = require "cmp.types"
local hide_text_entries = function(entry, _)
    return types.lsp.CompletionItemKind[entry:get_kind()] ~= "Snippet"
end

-- These control the order of completion items fed into the menus
-- see :h cmp-sources[n].group_index

function M.editor()
    return {
        {
            name = "nvim_lsp",
            entry_filter = hide_text_entries,
            group_index = 1,
        },
        { name = "nvim_lua", entry_filter = hide_text_entries, group_index = 1 },
        { name = "vim-dadbod-completion", group_index = 1},
        { name = "luasnip", group_index = 1 },
        { name = "neorg", group_index = 1 },
        { name = "nerdfont", group_index = 2 },
        { name = "path", group_index = 3 },
        { name = "buffer", group_index = 3}
    }
end

function M.cmdline()
    return {
        { name = "cmdline", group_index = 1 },
        { name = "path", group_index = 2 },
    }
end

function M.search()
    return {
        { name = "buffer", group_index = 1 },
    }
end

return M
