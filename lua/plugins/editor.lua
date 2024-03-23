local utils = require "core.utils"

return {
    {
        "justbarnt/bmessages.nvim",
        enabled = utils.enabled("plugins", "bmessages"),
        event = "CmdlineEnter",
        keys = {
            { "<leader>mt", "<CMD>Bmessages<CR>", desc = "Toggle Messages Buffer" },
        },
        opts = {},
        config = function(_, opts)
            require("bmessages").setup(utils.create_spec("bmessages", opts))
            utils.map("n", "<leader>mb", "<CMD>ShowMessageFloat<CR>", { desc = "Show Scratch Message Buffer" })
        end,
    },
    {
        "Bekaboo/deadcolumn.nvim",
        enabled = utils.enabled("plugins", "deadcolumn"),
        opts = {},
        config = function(_, opts)
            require("deadcolumn").setup(utils.create_spec("deadcolumn", opts))
        end,
    },
    {
        "pteroctopus/faster.nvim",
        enaled = utils.enabled("plugins", "faster"),
        opts = {},
        config = function(_, opts)
            require("faster").setup(utils.create_spec("faster", opts))
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        enabled = utils.enabled("plugins", "flash"),
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
        ---@type Flash.Config
        opts = {
            search = {
                incremental = true,
                mode = "search",
            }
        },
        config = function(_, opts)
            require('flash').setup(utils.create_spec("flash", opts))
        end,
    },
    {
        "backdround/global-note.nvim",
        enabled = utils.enabled("plugins", "global-note"),
        cmd = { "GlobalNote" },
        keys = {
            { "<leader>gn", "<CMD>GlobalNote<CR>", desc = "Opens Global Notepad" },
        },
        opts = {
            -- Filename to use for default note (preset).
            -- string or fun(): string
            filename = "global.norg",

            -- Directory to keep default note (preset).
            -- string or fun(): string
            directory = vim.fn.stdpath "data" .. "/global-note/",

            -- Floating window title.
            -- string or fun(): string
            title = "Todo: " .. os.date "%Y/%m/%d",

            -- Ex command name.
            -- string
            command_name = "GlobalNote",

            -- A nvim_open_win config to show float window.
            -- table or fun(): table
            window_config = function()
                local window_height = vim.api.nvim_list_uis()[1].height
                local window_width = vim.api.nvim_list_uis()[1].width
                return {
                    relative = "editor",
                    border = "single",
                    title = "Note",
                    title_pos = "center",
                    width = math.floor(0.7 * window_width),
                    height = math.floor(0.85 * window_height),
                    row = math.floor(0.05 * window_height),
                    col = math.floor(0.15 * window_width),
                }
            end,

            -- It's called after the window creation.
            -- fun(buffer_id: number, window_id: number)
            post_open = function(_, _) end,

            -- Whether to use autosave. Autosave saves buffer on closing window
            -- or exiting Neovim.
            -- boolean
            autosave = true,

            -- Additional presets to create other global, project local, file local
            -- and other notes.
            -- { [name]: table } - tables there have the same fields as the current table.
            additional_presets = {},
        },
        config = function(_, opts)
            require("global-note").setup(utils.create_spec("global-note", opts))
        end,
    },
    {
        "theprimeagen/harpoon",
        enabled = utils.enabled("plugins", "harpoon"),
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
            local harpoon = require "harpoon"

            harpoon:setup(utils.create_spec("harpoon", opts))

            -- Keys
            utils.map("n", "<leader>ha", function()
                harpoon:list():append()
                local file_name = vim.api.nvim_buf_get_name(0)
                vim.notify("[Harpoon] Added " .. file_name .. " to list", vim.log.levels.INFO)
            end, { desc = "Harpoon Add" })

            -- Toggle a UI popup of or current harpooned items.
            utils.map("n", "<leader>hl", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Toggle" })

            for i = 1, 5 do
                utils.map("n", string.format("<leader>%s", i), function()
                    harpoon:list():select(i)
                end, { desc = "Harpoon jump to file: [" .. i .. "]" })
            end
        end,
    },
    {
        "karb94/neoscroll.nvim",
        enabled = utils.enabled("plugins", "neoscroll"),
        opts = {},
        config = function(_, opts)
            require("neoscroll").setup(utils.create_spec("neoscroll", opts))
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        enabled = utils.enabled("plugins", "nvim-highlight-colors"),
        event = "BufReadPre",
        opts = {
            render = "virtual",
            enabled_named_colors = true,
            enabled_tailwind = true,
        },
        config = function(_, opts)
            require("nvim-highlight-colors").setup(utils.create_spec("nvim-highlight-colors", opts))
        end,
    },
    {
        "epwalsh/pomo.nvim",
        enabled = utils.enabled("plugins", "pomo"),
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
            require("pomo").setup(utils.create_spec("pomo", opts))
        end,
    },
    {
        "LintaoAmons/cd-project.nvim",
        enabled = utils.enabled("plugins", "cd-project"),
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
            require("cd-project").setup(utils.create_spec("cd-project", opts))
        end,
    },
    {
        "folke/todo-comments.nvim",
        enabled = utils.enabled("plugins", "todo-comments"),
        event = "BufEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>fc", "<CMD>TodoTelescope<CR>", desc = "Find Todo's" },
        },
        opts = {},
        config = function(_, opts)
            require("todo-comments").setup(utils.create_spec("todo-comments", opts))
        end,
    },
    {
        "theprimeagen/vim-apm",
        enabled = utils.enabled("plugins", "vim-apm"),
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
            require("vim-apm"):setup(utils.create_spec("vim-apm", opts))
        end,
    },
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        opts = {
            animation = {
                fps = 100,
                duration = 250,
                easing = "in_out_quad",
            },
        },
        config = function(_, opts)
            vim.o.winwidth = 10
            vim.o.winminwidth = 5
            vim.o.equalalways = false
            require("windows").setup(utils.create_spec("windows", opts))
        end,
    },
}
