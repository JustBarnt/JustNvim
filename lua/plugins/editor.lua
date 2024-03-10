local create_spec = require("core.utils").create_spec

return {
    -- bigfile
    {
        "lunarvim/bigfile.nvim",
        opts = {
            pattern = { ".log", ".xml", ".txt" },
        },
        config = function(_, opts)
            require("bigfile").setup(create_spec("bigfile", opts))
        end,
    },
    -- bmessages
    {
        "ariel-frischer/bmessages.nvim",
        event = "CmdlineEnter",
        opts = {},
        config = function(_, opts)
            local map = require("core.utils").map

            require("bmessages").setup(create_spec("bmessages", opts))
            map("n", "<leader>mb", "<CMD>ShowMessageFloat<CR>", { desc = "Show Scratch Message Buffer" })
        end,
    },
    -- corn
    {
        "RaafatTurki/corn.nvim",
        opts = {
            scope = "line",
            border_style = "rounded",
            blacklisted_modes = { "v", "V", "c" },
            blacklisted_severities = { vim.diagnostic.severity.HINT },
            on_toggle = function(_) end,
            vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text }),
        },
        config = function(_, opts)
            local map = require("core.utils").map
            vim.diagnostic.config({ virtual_text = false })

            map("n", "<leader>cd", "<CMD>Corn toggle", { desc = "Toggle Corner Diagnostics " })
            map("n", "<leader>cs", "<CMD>Corn scope_cycle", { desc = "Cycle Corner Diagnostics Scope" })
            require("corn").setup(create_spec("corn", opts))
        end,
    },
    -- harpoon
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        },
        config = function(_, opts)
            local map = require("core.utils").map
            local harpoon = require "harpoon"

            harpoon:setup(create_spec("harpoon", opts))

            -- Keys
            map("n", "<leader>ha", function()
                harpoon:list():append()
                local file_name = vim.api.nvim_buf_get_name(0)
                vim.notify("[Harpoon] Added " .. file_name .. " to list", vim.log.levels.INFO)
            end, { desc = "Harpoon Add" })

            -- Toggle a UI popup of or current harpooned items.
            map("n", "<leader>hl", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Toggle" })

            for i = 1, 5 do
                map("n", string.format("<leader>%s", i), function()
                    harpoon:list():select(i)
                end, { desc = "Harpoon jump to file: [" .. i .. "]" })
            end
        end,
    },
    -- neoscroll
    {
        "karb94/neoscroll.nvim",
        opts = {},
        config = function(_, opts)
            require("neoscroll").setup(create_spec("neoscroll", opts))
        end,
    },
    -- nvim-highlight-colors
    {
        "brenoprata10/nvim-highlight-colors",
        event = "BufReadPre",
        opts = {
            render = "virtual",
            enabled_named_colors = true,
            enabled_tailwind = true,
        },
        config = function(_, opts)
            require("nvim-highlight-colors").setup(create_spec("nvim-highlight-colors", opts))
        end,
    },
    -- pomodoro
    {
        "epwalsh/pomo.nvim",
        version = "v0.4.3",
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat" },
        opts = {
            update_interval = 1000,
            notifiers = {
                {
                    name = "Default",
                    opts = {
                        sticky = false,
                    },
                },
            },
        },
        config = function(_, opts)
            require("pomo").setup(create_spec("pomo", opts))
        end,
    },
    -- projects
    {
        "LintaoAmons/cd-project.nvim",
        opts = {
            -- this json file is acting like a database to update and read the projects in real time.
            -- So because it's just a json file, you can edit directly to add more paths you want manually
            projects_config_filepath = vim.fs.normalize(vim.fn.stdpath "config" .. "/cd-project.nvim.json"),
            -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
            project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
            choice_format = "both", -- optional, you can switch to "name" or "path"
            projects_picker = "telescope", -- optional, you can switch to `telescope`
            -- do whatever you like by hooks
            hooks = {
                {
                    callback = function(dir)
                        vim.notify("switched to dir: " .. dir)
                    end,
                },
                {
                    callback = function(_)
                        vim.cmd "Telescope find_files"
                    end,
                },
            },
        },
        config = function(_, opts)
            require("cd-project").setup(create_spec("cd-project", opts))
        end,
    },
    -- todo-comments
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoQuickFix", "TodoTelescope", "TodoLocList" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>fc", "<CMD>TodoTelescope<CR>", desc = "Find Todo's" },
        },
        opts = {},
        config = function(_, opts)
            require("todo-comments").setup(create_spec("todo-comments", opts))
        end,
    },
    -- vim
    {
        "theprimeagen/vim-apm",
        keys = {
            {
                "<leader>apm",
                function()
                    require("vim-apm"):toggle_monitor()
                end,
                desc = "Toggle Actions Per Minute",
            },
        },
        opts = {
            reporter = {
                type = "memory",
            },
        },
        config = function(_, opts)
            require("vim-apm"):setup(create_spec("vim-apm", opts))
        end,
    },
}
