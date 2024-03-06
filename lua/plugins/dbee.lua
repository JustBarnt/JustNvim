return {
    -- "kndndrj/nvim-dbee",
    "justbarnt/nvim-dbee",
    dependencies = { "muniftanjim/nui.nvim" },
    config = function()
        local sources = require "dbee.sources"
        local dbee = require "dbee"
        local layout = require("dbee.layouts").Default
        dbee.setup({
            sources = {
                sources.MemorySource:new({
                    {
                        name = "CommSys",
                        type = "sqlserver",
                        url = "sqlserver://sa:admin@localhost?database=CommSys&TrustServerCertificate=true",
                    },
                }),
            },
        })
    end,
}
