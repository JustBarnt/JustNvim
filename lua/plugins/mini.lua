local utils = require "core.utils"

return {
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
