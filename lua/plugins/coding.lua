local utils = require "core.utils"

return {

    {
        "numToStr/Comment.nvim",
        enabled = utils.enabled("plugins", "Comment"),
        keys = {
            { "gc", mode = { "n", "v" }, desc = "Toggle Comment Line Wise" },
            { "gb", mode = { "n", "v" }, desc = "Toggle Comment Block Wise" },
        },
        opts = function()
            local commentstring_avail, comment_string =
                pcall(require, "ts_context_commentstring.integrations.comment_nvim")
            return commentstring_avail and comment_string and { pre_hook = comment_string.create_pre_hook() } or {}
        end,
        config = function(_, opts)
            require("Comment").setup(utils.create_spec("Comment", opts))
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        enabled = utils.enabled("plugins", "inc-rename"),
        command = "IncRename",
        opts = {
            hl_group = "Substitute",
            input_buffer_type = "dressing",
        },
        config = function(_, opts)
            require("inc_rename").setup(utils.create_spec("inc-rename", opts))
        end,
    },
    {
        "danymat/neogen",
        enabled = utils.enabled("plugins", "neogen"),
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        keys = function()
            local neogen = require "neogen"
            return {
                {
                    "<leader>tf",
                    function()
                        neogen.generate({ type = "func" })
                    end,
                    desc = "Generate Docs: Function",
                },
                {
                    "<leader>tt",
                    function()
                        neogen.generate({ type = "type" })
                    end,
                    desc = "Generate Docs: Type",
                },
                {
                    "<leader>tc",
                    function()
                        neogen.generate({ type = "class" })
                    end,
                    desc = "Generate Docs: Class",
                },
                {
                    "<leader>ts",
                    function()
                        neogen.generate({ snippet_engine = "luasnip" })
                    end,
                    desc = "Generate Docs from Snippet",
                },
            }
        end,
        opts = {
            snippet_engine = "luasnip",
        },
        config = function(_, opts)
            require("neogen").setup(utils.create_spec("neogen", opts))
        end,
    },
    {
        {
            "justbarnt/nvim-cheatsh",
            enabled = utils.enabled("plugins", "nvim-cheatsh"),
            cmd = { "Cheat", "CheatClose", "CheatList" },
            opts = {
                cheatsh_url = "cht.sh/",
            },
            keys = {
                { "<leader>cs", "<CMD>CheatList<CR>", desc = "Search Cheat Sheets" },
            },
            config = function(_, opts)
                require("nvim-cheatsh").setup(utils.create_spec("nvim-cheatsh", opts))
            end,
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        enabled = utils.enabled("plugins", "lsp_signature"),
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded",
            },
            hint_enable = false,
        },
        config = function(_, opts)
            require("lsp_signature").setup(utils.create_spec("lsp_signature", opts))
        end,
    },
    {
        "folke/trouble.nvim",
        enabled = utils.enabled("plugins", "trouble"),
        event = "BufEnter",
        cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>xx", "<CMD>Trouble<CR>", desc = "Trouble Toggle" },
            { "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", desc = "Trouble Workspace Diagnostics" },
            { "<leader>xd", "<CMD>Trouble document_diagnostics<CR>", desc = "Trouble Document Diagnostics" },
            { "<leader>xq", "<CMD>Trouble quickfix<CR>", desc = "Trouble Quick Fix" },
            { "<leader>xl", "<CMD>Trouble loclist<CR>", desc = "Trouble Local List" },
        },
        opts = {
            -- position = "right", -- position of the list can be: bottom, top, left, right
            -- width = 80, -- width of the list when position is left or right
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = { "o" }, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
                close_folds = { "zM", "zm" }, -- close all folds
                open_folds = { "zR", "zr" }, -- open all folds
                toggle_fold = { "zA", "za" }, -- toggle fold of current file
                previous = "k", -- previous item
                next = "j", -- next item
                help = "?", -- help menu
            },
            win_config = { border = "solid" }, -- window configuration for floating windows. See |nvim_open_win()|.
        },
        config = function(_, opts)
            require("trouble").setup(utils.create_spec("trouble", opts))
        end,
    },
    {
        "dmmulroy/ts-error-translator.nvim",
        enabled = utils.enabled("plugins", "ts-error-translator"),
        ft = { "ts", "svelte" },
        event = "BufEnter",
        opts = {},
    },
}
