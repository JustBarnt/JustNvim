return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = function()
        require 'user.plugins.harpoon'.keys()
    end,
    config = function()
        require 'user.plugins.harpoon'.setup()
    end,
}

