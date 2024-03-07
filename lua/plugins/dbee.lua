return {
    -- "kndndrj/nvim-dbee",
    "justbarnt/nvim-dbee",
    dependencies = { "muniftanjim/nui.nvim" },
    config = function()
        local sources = require "dbee.sources"
        local dbee = require "dbee"
        local edit = require "dbee.ui.editor.init"
        dbee.setup({
            sources = {
                sources.FileSource:new(vim.fn.stdpath('cache') .. "/dbee/persistance.json")
            },
            editor = {
                mappings = {
                    { key = "<C-e>", mode = "v", action = "run_selection"},
                    { key = "<C-e>", mode = "n", action = "run_file"}
                }
            }
        })
    end,
}
