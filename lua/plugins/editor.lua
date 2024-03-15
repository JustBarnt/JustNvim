local create_spec = require("utils").create_spec

return {
    -- bmessages
    {
        "justbarnt/bmessages.nvim",
        event = "CmdlineEnter",
        keys = {
            { "<leader>mt", "<CMD>Bmessages<CR>", desc = "Toggle Messages Buffer" },
        },
        opts = {},
        config = function(_, opts)
            local map = require("utils").map

            require("bmessages").setup(create_spec("bmessages", opts))
            map("n", "<leader>mb", "<CMD>ShowMessageFloat<CR>", { desc = "Show Scratch Message Buffer" })
        end,
    },
    --edgy
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = "screen"
        end,
        opts = {
            bottom = {
                -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
                {
                    ft = "toggleterm",
                    size = { height = 0.4 },
                    -- exclude floating windows
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                {
                    ft = "Trouble",
                    size = { height = 0.4 },
                },
                {
                    ft = "bmessages",
                    size = { height = 0.4 },
                },
            },
            left = {
                {
                    title = "File Explorer",
                    ft = "neo-tree",
                    pinned = true,
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "filesystem"
                    end,
                    size = { height = 0.4 },
                },
            },
        },
    },
    -- global note
    {
        "backdround/global-note.nvim",
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
            require("global-note").setup(create_spec("global-note", opts))
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
            local map = require("utils").map
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
        event = "BufEnter",
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
