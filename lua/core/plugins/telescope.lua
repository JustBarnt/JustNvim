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
            return {
                { "<leader>fh", builtin.help_tags, desc = "Find Help Tags" },
                { "<leader>ff", builtin.find_files, desc = "Find Files" },
                { "<leader>fs", builtin.builtin, desc = "Find Telescope Builtins" },
                { "<leader>fg", builtin.live_grep, desc = "Find Word in File " },
                { "<leader>fd", builtin.diagnostics, desc = "Find Diagnostics" },
                { "<leader>fr", builtin.resume, desc = "Find Resume last Telescope Session" },
                { "<leader>fo", builtin.oldfiles, desc = "Find Oldfiles" },
                { "<leader>ft", "<CMD>Telescope themes<CR>", desc = "Find Themes" },
                { "<leader><leader>", builtin.buffers, desc = "Find Buffers" },
                {
                    "<leader>fw",
                    function()
                        vim.ui.input({ prompt = "Grep > " }, function(value)
                            builtin.grep_string({
                                use_regex = true,
                                search = value,
                            })
                        end)
                    end,
                    desc = "Find by Grep",
                },
                {
                    "<leader>fk",
                    function()
                        builtin.keymaps({ show_plug = false })
                    end,
                    desc = "Find Keymaps",
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
                    "<leader>f/",
                    function()
                        builtin.live_grep({
                            grep_open_files = true,
                            prompt_title = "Live Grep in Open Files",
                        })
                    end,
                    desc = "Find in Open files",
                },
            }
        end,
        opts = function()
            local actions = require "telescope.actions"
            local status, trouble = pcall(require, "trouble.providers.telescope")
            local extras = require "utils.telescope"

            return {
                defaults = {
                    mappings = {
                        i = {
                            ["<c-t>"] = status and trouble.open_with_trouble or actions.nop,
                            ["<C-q>"] = extras.fzf_multi_select,
                        },
                        n = {
                            ["<C-q>"] = extras.fzf_multi_select,
                            ["<c-t>"] = status and trouble.open_with_trouble or actions.nop,
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
                    cmdline = {
                        picker = {
                            initial_mode = "normal",
                            layout_config = {
                                width = 60,
                                height = 10,
                            },
                        },
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
                    find_files = require("utils").select_find_command(), --vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
                },
            }
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            local user_config = require "user.config"
            local config = vim.tbl_deep_extend("force", opts, user_config.telescope or {})

            telescope.setup(config)
            telescope.load_extension "themes"
            telescope.load_extension "cmdline"
            telescope.load_extension "luasnip"
        end,
    },
}
