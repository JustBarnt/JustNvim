local utils = require "core.utils"

return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "0.1.x",
        dependencies = {
            { "piersolenski/telescope-import.nvim", enabled = vim.fn.executable "rg" },
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
            "andrew-george/telescope-themes",
            "debugloop/telescope-undo.nvim",
        },
        cmd = { "Telescope", "TodoTelescope", "TelescopeHighlights" },
        keys = function()
            local builtin = require "telescope.builtin"
            return {
                { "<leader>sr", "<CMD>Telescope frecency workspace=CWD<CR>", desc = "Search Recent Telescopes" },
                { "<leader>sh", builtin.help_tags, desc = "Search Help Tags" },
                { "<leader>sf", builtin.find_files, desc = "Search Files" },
                { "<leader>ss", builtin.builtin, desc = "Search Telescope Builtins" },
                { "<leader>sg", builtin.live_grep, desc = "Search Word in File " },
                { "<leader>sd", builtin.diagnostics, desc = "Search Diagnostics" },
                { "<leader>so", builtin.oldfiles, desc = "Search Oldfiles" },
                { "<leader>st", "<CMD>Telescope themes<CR>", desc = "Search Themes" },
                { "<leader><leader>", builtin.buffers, desc = "Search Buffers" },
                { "<leader>sk", "<CMD>LegendaryKeymaps<CR>", desc = "Search Keymaps" },
                { "<leader>sc", "<CMD>LegendaryCommands<CR>", desc = "Search Commands" },
                { "<leader>si", "<CMD>Telescope import<CR>", desc = "Search Module Imports" },
                { "<leader>su", "<CMD>Telescope undo<CR>", desc = "Search UndoTree" },
                {
                    "<leader>sw",
                    function()
                        builtin.grep_string({ search = vim.fn.expand "<cword>" })
                    end,
                    desc = "Search for Word Under Cursor",
                },
                {
                    "<leader>sW",
                    function()
                        builtin.grep_string({ search = vim.fn.expand "<cWORD>" })
                    end,
                    desc = "Search for Word Under Cursor",
                },
                {
                    "<leader>sp",
                    function()
                        builtin.grep_string({
                            search = vim.fn.input({ prompt = "Grep > " }),
                        })
                    end,
                    desc = "Search by Grep",
                },
                {
                    "<leader>/",
                    function()
                        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                            winblend = 10,
                            previewer = false,
                        }))
                    end,
                    desc = "[/] Fuzzy Search Current Buffer",
                },
                {
                    "<leader>s/",
                    function()
                        builtin.live_grep({
                            grep_open_files = true,
                            prompt_title = "Live Grep in Open Files",
                        })
                    end,
                    desc = "Search in Open files",
                },
            }
        end,
        opts = function()
            local actions = require "telescope.actions"

            return {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        },
                        n = {
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        },
                    },
                },
                extensions = {
                    themes = {
                        require("telescope.themes").get_dropdown({
                            layout_config = {
                                width = 120,
                                height = 60,
                            },
                        }),
                        enable_live_preview = true,
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath "config" .. "/lua/colorscheme.lua",
                        },
                    },
                    import = {
                        custom_languages = {
                            {
                                regex = [[\s{4,}?(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
                                filetypes = { "svelte" },
                                extensions = { "svelte" },
                            },
                        },
                    },
                    undo = {
                        use_delta = false,
                    },
                },
                pickers = {
                    buffers = {
                        initial_mode = "normal",
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["d"] = actions.delete_buffer,
                            },
                        },
                    },
                    find_files = require("core.utils").select_find_command(), --vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
                },
            }
        end,
        config = function(_, opts)
            local telescope = require "telescope"

            telescope.setup(utils.create_spec("telescope", opts))
            telescope.load_extension "themes"
            telescope.load_extension "luasnip"
            telescope.load_extension "undo"

            if vim.fn.executable "rg" then
                telescope.load_extension "import"
            end
        end,
    },
}
