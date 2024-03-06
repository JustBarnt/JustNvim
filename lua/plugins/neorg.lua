return {
    "nvim-neorg/neorg",
    lazy = true,
    build = ":Neorg sync-parsers",
    tag = "v7.0.0",
    dependencies = { "nvim-lua/plenary.nvim" },
}
