return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "muniftanjim/nui.nvim",
    },
    config = function()
        require('dbee').setup({})
    end
}
