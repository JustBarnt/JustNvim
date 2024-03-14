local utils = require "utils"
local mini_utils = require "utils.minifiles"

return {
    -- mini.ai
    {
        "echasnovski/mini.align",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.align").setup(utils.create_spec("mini_align", opts))
        end,
    },
    -- mini.cursor
    {
        "echasnovski/mini.cursorword",
        event = "CursorHold",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.cursorword").setup(utils.create_spec("mini_cursorword", opts))
        end,
    },
    -- mini.files (A vim-vinegar file explorer that lets you edit the filesystem like a buffer)
    {
        "echasnovski/mini.files",
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
            require("mini.files").setup(utils.create_spec("mini_files", opts))
            utils.map("n", "<leader>do", MiniFiles.open, { desc = "Open File Explorer" })
        end,
    },
    -- mini.indent
    {
        "echasnovski/mini.indentscope",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.indentscope").setup(utils.create_spec("mini_indentscope", opts))
        end,
    },
    -- mini.jump
    {
        "echasnovski/mini.jump",
        event = "BufEnter",
        version = "*",
        enabled = false, -- TODO: Setup enabled to match `utils.create_spec`
        opts = {},
        config = function(_, opts)
            require("mini.jump").setup(utils.create_spec("mini_jump", opts))
        end,
    },
    -- mini.misc
    {
        "echasnovski/mini.misc",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.misc").setup(utils.create_spec("mini_misc", opts))
        end,
    },
    -- mini.move
    {
        "echasnovski/mini.move",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.move").setup(utils.create_spec("mini_move", opts))
        end,
    },
    -- mini.operators
    {
        "echasnovski/mini.operators",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.operators").setup(utils.create_spec("mini_operators", opts))
        end,
    },
    -- mini.pairs
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.pairs").setup(utils.create_spec("mini_pairs", opts))
        end,
    },
    -- mini.splitjoin
    {
        "echasnovski/mini.splitjoin",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.splitjoin").setup(utils.create_spec("mini_splitjoin", opts))
        end,
    },
    -- mini.surround
    {
        "echasnovski/mini.surround",
        event = "BufEnter",
        version = "*",
        opts = {},
        config = function(_, opts)
            require("mini.surround").setup(utils.create_spec("mini_surround", opts))
        end,
    },
}
