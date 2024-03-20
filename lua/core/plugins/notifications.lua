return {
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "NotifyBackground",
            fps = 60,
            render = "wrapped-compact",
            stages = "fade",
            timeout = 2500,
        },
        config = function(_, opts)
            require("notify").setup(opts)
            vim.notify = require("notify")
        end,
    },
}
