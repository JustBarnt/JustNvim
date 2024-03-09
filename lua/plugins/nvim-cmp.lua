return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                tag = "v2.2.0",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "benfowler/telescope-luasnip.nvim",
                },
                -- build = function()
                --     if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                --         return
                --     end
                --
                --     return "make install_jsregexp"
                -- end,
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load({ path = vim.fn.stdpath "config" .. "/snippets" })
                    local extends = {
                        typescript = { "tsdoc" },
                        javascript = { "tsdoc" },
                        lua = { "luadoc" },
                        cs = { "csharpdoc" },
                        c = { "cdoc" },
                        cpp = { "cppdoc" },
                        php = { "phpdoc" },
                        svelte = { "tsdoc", "html" },
                    }

                    for key, value in pairs(extends) do
                        require("luasnip").filetype_extend(key, value)
                    end

                    -- friendly-snippets - enable standardized comments snippets
                    -- require("luasnip").filetype_extend("typescript", { "tsdoc" })
                    -- require("luasnip").filetype_extend("javascript", { "jsdoc" })
                    -- require("luasnip").filetype_extend("lua", { "luadoc" })
                    -- require("luasnip").filetype_extend("cs", { "csharpdoc" })
                    -- require("luasnip").filetype_extend("c", { "cdoc" })
                    -- require("luasnip").filetype_extend("cpp", { "cppdoc" })
                    -- require("luasnip").filetype_extend("php", { "phpdoc" })
                    -- require("luasnip").filetype_extend("svelte", { "tsdoc", "html" })
                end,
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "chrisgrieser/cmp-nerdfont",
            "onsails/lspkind-nvim",
            { "MattiasMTS/cmp-dbee", ft = "sql" },
        },
    },
}
