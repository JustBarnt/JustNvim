return {
    "roobert/activate.nvim",
    keys = {
        {
            "<leader>fP",
            "<CMD>lua require('activate').list_plugins()<CR>",
            desc = "Find Plugins",
        },
    },
    dependencies = {

        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
}
