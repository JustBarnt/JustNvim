return {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
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
    },
}
