return {
    "rcarriga/nvim-notify",
    config = function()
        local config = {
            background_colour = "NotifyBackground",
            fps = 60,
            render = "compact",
            stages = "slide",
        }
        require("notify").setup(config)
    end,
}
