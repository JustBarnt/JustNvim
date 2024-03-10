local create_spec = require("core.utils").create_spec

return {
    -- comment
    {
        "numToStr/Comment.nvim",
        keys ={
            { "gc", mode = { 'n', 'v' }, desc = "Toggle Comment Line Wise"},
            { "gb", mode = { 'n', 'v' }, desc = "Toggle Comment Block Wise"}
        },
        opts = function()
            local commentstring_avail, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
            return commentstring_avail and comment_string and { pre_hook = comment_string.create_pre_hook } or {}
        end,
        config = function(_, opts)
            require("Comment").setup(create_spec('Comment', opts))
        end,
    },
    -- indent-blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require "ibl.hooks"
            local scope = "focus"
            local indent = "passive"

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "focus", { fg = "#C4A7E7" })
                vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
            end)

            require("ibl").setup({
                scope = { highlight = scope },
                indent = { highlight = indent },
                exclude = {
                    filetypes = {
                        "help",
                        "dashboard",
                        "Trouble",
                        "trouble",
                        "lazy",
                        "mason",
                        "oil",
                    },
                },
            })
        end,
    },
    -- neogen
    {
        "danymat/neogen",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            --NOTE: Move into config files
            local map = require("core.utils").map
            local neogen = require "neogen"

            neogen.setup({
                snippet_engine = "luasnip",
            })

            map("n", "<leader>tf", function()
                neogen.generate({ type = "func" })
            end, { desc = "Generate Docs: Function" })

            map("n", "<leader>tt", function()
                neogen.generate({ type = "type" })
            end, { desc = "Generate Docs: Type" })

            map("n", "<leader>tc", function()
                neogen.generate({ type = "class" })
            end, { desc = "Generate Docs: Class" })
        end,
    },
    -- dbee
    {
        -- "kndndrj/nvim-dbee",
        "justbarnt/nvim-dbee",
        dependencies = { "muniftanjim/nui.nvim" },
        config = function()
            local sources = require "dbee.sources"
            local dbee = require "dbee"
            local edit = require "dbee.ui.editor.init"
            dbee.setup({
                sources = {
                    sources.FileSource:new(vim.fn.stdpath "cache" .. "/dbee/persistance.json"),
                },
                editor = {
                    mappings = {
                        { key = "<C-e>", mode = "v", action = "run_selection" },
                        { key = "<C-e>", mode = "n", action = "run_file" },
                    },
                },
            })
        end,
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
    -- trouble
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local map = require("core.utils").map
            local trouble = require "trouble"
            local config = require("user.plugins.trouble").config

            trouble.setup(config)

            --Keymaps
            map("n", "<leader>xx", function()
                require("trouble").toggle()
            end, { desc = "Trouble Toggle" })
            map("n", "<leader>xw", function()
                require("trouble").toggle "workspace_diagnostics"
            end, { desc = "Trouble Workspace Diagnostics" })
            map("n", "<leader>xd", function()
                require("trouble").toggle "document_diagnostics"
            end, { desc = "Trouble Document Diagnostics" })
            map("n", "<leader>xq", function()
                require("trouble").toggle "quickfix"
            end, { desc = "Trouble Quick Fix" })
            map("n", "<leader>xl", function()
                require("trouble").toggle "loclist"
            end, { desc = "Trouble Local List" })
        end,
    },
    -- ts-error-translator
    {
        "dmmulroy/ts-error-translator.nvim",
        opts = {},
    },
    -- vim-sleuth
    {
        "tpope/vim-sleuth"
    }
}
