local compare = require("core.completion.comparators").compare
local icons = require("user.icons").cmp
local cmp = require "cmp"
local types = require "cmp.types"
local luasnip = require "luasnip"
luasnip.config.setup({})

--Follow this for setting up auto doxygen like snippets: https://github.com/NormalNvim/NormalNvim/blob/main/lua/plugins/4-dev.lua#L88C10-L88C18

---@class cmp.ConfigSchema
local config = {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = { completeopt = "menu,menuone,noinsert" },
    mapping = cmp.mapping.preset.insert({
        -- Navigating
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { "i", "s" }),
        -- Temp Maps
        ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Replace, select = true }), { "i" }),
        ["Up>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["Down>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "nerdfont" },
        { name = "neorg" },
        { name = "path" },
    },
    -- Order sources are defined are the order they appear on the completion menu
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.order,
            cmp.config.compare.kind,
            compare(types.lsp.CompletionItemKind.Keyword),
            compare(types.lsp.CompletionItemKind.Snippet),
        },
    },
    experimental = {
        ghost_text = true,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                luasnip = "[LuaSnip]",
                nerdfont = "[NF]",
                neorg = "[Neorg]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
}

-- Setup autocompletion for LSP and others
cmp.setup(config)

-- Setup autocompletion for search
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer" },
    }),
})

-- Setup autocompletion for cmdline
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" },
    }),
})
