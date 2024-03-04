return {
    "kndndrj/nvim-dbee",
    tag = "v0.1.0",
    dependencies = {
        {
            "muniftanjim/nui.nvim",
            commit = "35da9ca1de0fc4dda96c2e214d93d363c145f418",
        },
    },
    config = function()
        require("dbee").setup({
            sources = vim.list_extend(require("dbee.config").default.sources, {
                require("dbee.sources").EnvSource:new "DBEE_CONNECTIONS",
                require("dbee.sources").FileSource:new(vim.fn.stdpath "cache" .. "/dbee/persistence.json"),
            }),
        })
    end,
}
