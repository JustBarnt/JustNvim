return {
    -- "kndndrj/nvim-dbee",
    "justbarnt/nvim-dbee",
    dependencies = { "muniftanjim/nui.nvim" },
    config = function()
        local sources = require "dbee.sources"
        local dbee = require "dbee"
        dbee.setup({
            sources = {
                require('dbee.sources').FileSource:new(vim.fn.stdpath('cache') .. "/dbee/persistance.json")
            }
        })
    end,
}
