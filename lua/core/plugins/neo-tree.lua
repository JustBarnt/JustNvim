local utils = require "utils"

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    event = "VeryLazy",
    cmd = {"Neotree"},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            event = "VeryLazy",
            version = "2.*",
            opts = {
                filter_rules = {
                    include_current_win = false,
                    autoselect_one = true,
                    bo = {
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        buftype = { "terminal", "quickfix" },
                    },
                },
            },
            config = function(_, opts)
                require("window-picker").setup(utils.create_spec("window-picker", opts))
            end,
        },
    },
    keys = {
        {'<leader>ex', "<CMD>Neotree<CR>", desc = "Open File Explorer"}
    },
    opts = {
        close_if_last_window = true,
        default_source = "filesystem",
        sources = { "filesystem", "buffers", "git_status" },
    },
    config = function(_, opts)
        require("neo-tree").setup(utils.create_spec("neo-tree", opts))
    end,
}
