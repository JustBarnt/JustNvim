return {
    -- "kndndrj/nvim-dbee",
    "justbarnt/nvim-dbee",
    dependencies = { "muniftanjim/nui.nvim" },
    config = function()
        local sources = require "dbee.sources"
        local dbee = require "dbee"
        local layout = require("dbee.layouts").Default
        dbee.setup({
            
        })
    end,
}
