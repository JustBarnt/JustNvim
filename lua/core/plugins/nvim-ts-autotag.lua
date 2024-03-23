local utils = require "core.utils"

return {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
        require("nvim-ts-autotag").setup(utils.create_spec("nvim-ts-autotag", opts))
    end,
}
