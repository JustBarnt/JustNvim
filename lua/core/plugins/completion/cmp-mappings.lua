local M = {}

function M.insert(cmp, luasnip)
    return cmp.mapping.preset.insert({
        -- Go-To next and previous completions
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Scroll Docs
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Close Completion Menu
        ["<TAB>"] = cmp.mapping.abort(),

        -- Confirm Selection
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i" }),

        -- Invoke Completion Menu
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Jump to Next and Previous Snippet expansions
        ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip and luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip and luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }), -- Select Completion Item
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i" }),
    })
end

return M
