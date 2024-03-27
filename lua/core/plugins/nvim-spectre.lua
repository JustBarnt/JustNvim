local utils = require "core.utils"
return {
    "nvim-pack/nvim-spectre",
    enabled = function()
        local has_sed = vim.fn.executable "sd" or vim.fn.executable "sed"
        local has_rg = vim.fn.executable "ripgrep"

        return has_sed and has_rg
    end,
    opts = {
        replace_engine = {
            ["sd"] = {
                cmd = "sd",
                options = {},
            },
        },
        default = {
            find = {
                cmd = "rg",
                options = { "ignore-case" },
            },
            replace = {
                cmd = vim.fn.executable "sd" and "sd" or vim.fn.executable "sed" and "sed",
            },
        },
    },
    config = function(_, opts)
        require("spectre").setup(utils.create_spec("spectre", opts))
    end,
}
