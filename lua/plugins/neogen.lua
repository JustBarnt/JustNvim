return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        --NOTE: Move into config files
        local map = require("core.utils").map
        local neogen = require "neogen"

        neogen.setup({
            snippet_engine = "luasnip",
        })

        map("n", "<leader>tf", function()
            neogen.generate({ type = "func" })
        end, { desc = "Generate Docs: Function"})

        map("n", "<leader>tt", function()
            neogen.generate({ type = "type" })
        end, { desc = "Generate Docs: Type"})

        map("n", "<leader>tc", function()
            neogen.generate({ type = "class" })
        end, { desc = "Generate Docs: Class"})
    end,
}
