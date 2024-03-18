return {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    dependencies = {
        {
            "kkharji/sqlite.lua",
        },
    }, -- Follow install instructions per readme: https://github.com/kkharji/sqlite.lua?tab=readme-ov-file#-installation
    cmds = { "Legendary", "LegendaryRepeat" },
    keys = {
        { "<leader>,", "<CMD>Legendary<CR>", desc = "Command Pallete" },
    },
    opts = {
        select_prompt = "󰆍 Command Pallete",
        extensions = {
            lazy_nvim = {
                auto_register = true,
            },
        },
        sort = {
            frecency = {
                db_root = string.format("%s/legendary/", vim.fn.stdpath "data"),
                max_timestamps = 10,
            }
        },
    },
}
