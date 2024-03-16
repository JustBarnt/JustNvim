local utils = require "utils"
local mini_utils = require "utils.minifiles"

return {
    -- mini.ai
    {
        "echasnovski/mini.align",
        enabled = utils.enabled("plugins", "mini.align"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.align").setup(utils.create_spec("mini.align", opts))
        end,
    },
    -- mini.cursor
    {
        "echasnovski/mini.cursorword",
        enabled = utils.enabled("plugins", "mini.cursorword"),
        event = "CursorHold",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.cursorword").setup(utils.create_spec("mini.cursorword", opts))
        end,
    },
    -- mini.files (A vim-vinegar file explorer that lets you edit the filesystem like a buffer)
    {
        "echasnovski/mini.files",
        enabled = utils.enabled("plugins", "mini.files"),
        version = "*",
        opts = {
            content = {
                filter = mini_utils.filter_hide,
                sort = nil,
            },
            mappings = {
                close = "q",
                go_in = "l",
                go_in_plus = "<CR>",
                go_out = "h",
                go_out_plus = "-",
                reset = "<BS>",
                reveal_cwd = "_",
                show_help = "g?",
                synchronize = "=",
                trim_left = "<",
                trim_right = ">",
            },
        },
        config = function(_, opts)
            require("mini.files").setup(utils.create_spec("mini.files", opts))
            utils.map("n", "<leader>do", MiniFiles.open, { desc = "Open File Explorer" })
        end,
    },
    -- mini.indent
    {
        "echasnovski/mini.indentscope",
        enabled = utils.enabled("plugins", "mini.indentscope"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.indentscope").setup(utils.create_spec("mini.indentscope", opts))
        end,
    },
    -- mini.jump
    {
        "echasnovski/mini.jump",
        enabled = utils.enabled("plugins", "mini.jump"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.jump").setup(utils.create_spec("mini.jump", opts))
        end,
    },
    -- mini.misc
    {
        "echasnovski/mini.misc",
        enabled = utils.enabled("plugins", "mini.misc"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.misc").setup(utils.create_spec("mini.misc", opts))
        end,
    },
    -- mini.move
    {
        "echasnovski/mini.move",
        enabled = utils.enabled("plugins", "mini.move"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.move").setup(utils.create_spec("mini.move", opts))
        end,
    },
    -- mini.operators
    {
        "echasnovski/mini.operators",
        enabled = utils.enabled("plugins", "mini.operators"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.operators").setup(utils.create_spec("mini.operators", opts))
        end,
    },
    -- mini.pairs
    {
        "echasnovski/mini.pairs",
        enabled = utils.enabled("plugins", "mini.pairs"),
        event = "InsertEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.pairs").setup(utils.create_spec("mini.pairs", opts))
        end,
    },
    -- mini.splitjoin
    {
        "echasnovski/mini.splitjoin",
        enabled = utils.enabled("plugins", "mini.splitjoin"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.splitjoin").setup(utils.create_spec("mini.splitjoin", opts))
        end,
    },
    -- mini.surround
    {
        "echasnovski/mini.surround",
        enabled = utils.enabled("plugins", "mini.surround"),
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.surround").setup(utils.create_spec("mini.surround", opts))
        end,
    },
}
