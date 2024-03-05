return {
    {
        "akinsho/toggleterm.nvim",
        tag = "v2.10.0",
        event = "ColorScheme",
        config = function()
            require('toggleterm').setup({
                highlights = require("rose-pine.plugins.toggleterm")
            })
        end,
    },
}
