local utils = require "core.utils"
return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    },
    opts = {},
    config = function(_, opts)
        require("outline").setup(utils.create_spec("outline", opts))
    end,
}
