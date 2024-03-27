local utils = require "core.utils"
return {
    "nvim-pack/nvim-spectre",
    enabled = function()
        local has_sed = vim.fn.executable "sd" or vim.fn.executable "sed"
        local has_rg = vim.fn.executable "ripgrep"

        return has_sed and has_rg
    end,
    opts = {},
    config = function(_, opts) end,
}
