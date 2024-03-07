return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "andrew-george/telescope-themes",
            "justbarnt/telescope-cmdline.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        --[[ keys = {
            { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" }
        }, ]]
    },
}
