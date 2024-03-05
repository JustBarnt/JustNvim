return {
    "epwalsh/pomo.nvim",
    version = "v0.4.3",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    config = function()
        local opts = {
            update_interval = 1000,
            notifiers = {
                {
                    name = "Default",
                    opts = {
                        sticky = false,
                    },
                },
            },
        }
        require("pomo").setup(opts)
    end,
}
