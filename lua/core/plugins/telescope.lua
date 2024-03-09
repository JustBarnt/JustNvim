return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "0.1.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
            "justbarnt/telescope-cmdline.nvim",
            "andrew-george/telescope-themes",
        },
        cmd = { "Telescope", "TodoTelescope", "TelescopeHighlights" },
        keys = function()
            local builtin = require "telescope.builtin"
            local show_keys = builtin.keymaps({ show_plug = false })
            local fzfind = builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))

            local grep = builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })

            return {
                { "<leader>fh", builtin.help_tags, desc = "Find Help Tags" },
                { "<leader>fk", show_keys, desc = "Find Keymaps" },
                { "<leader>ff", builtin.find_files, desc = "Find Files" },
                { "<leader>fs", builtin.builtin, desc = "Find Telescope Builtins" },
                { "<leader>fw", builtin.grep_string, desc = "Find Word in File " },
                { "<leader>fg", builtin.live_grep, desc = "Find by Grep" },
                { "<leader>fd", builtin.diagnostics, desc = "Find Diagnostics" },
                { "<leader>fr", builtin.resume, desc = "Find Resume last Telescope Session" },
                { "<leader>fo", builtin.oldfiles, desc = "Find Oldfiles" },
                { "<leader>ft", "<CMD>Telescope themes<CR>", desc = "Find Themes" },
                { "<leader><leader>", builtin.buffers, desc = "Find Buffers" },
                { "<leader>/", fzfind, desc = "[/] Fuzzy Search Current Buffer" },
                { "<leader>f/", grep, desc = "Find in Open files" },
            }
        end,
        opts = function()
            local actions = require "telescope.actions"
            return {
                defaults = {
                    initial_mode = "insert",
                },
                extensions = {},
                pickers = {
                    buffers = {
                        initial_mode = "normal",
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                                ["<c-q>"] = actions.close,
                            },
                            n = {
                                ["d"] = actions.delete_buffer,
                            },
                        },
                    }                   find_files = require("core.utils").select_find_command(), --vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
                },
            }
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            local exists, user_config = pcall(require, "user.config")
            local config = exists and type(user_config) == "table" and user_config.telescope or {}
            local telescope_config = vim.tbl_deep_extend("force", opts, config)

            telescope.setup(telescope_config)
            telescope.load_extension "themes"
            telescope.load_extension "cmdline"
            telescope.load_extension "luasnip"
        end,
    },
}
