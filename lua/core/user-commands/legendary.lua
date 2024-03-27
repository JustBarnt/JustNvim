local legendary = require "legendary"
local filters = require "legendary.filters"

local command = vim.api.nvim_create_user_command
local map = require("core.utils").map

command("LegendaryKeymaps", function()
    legendary.find({
        filters = { filters.keymaps() },
        select_prompt = function()
            return "Keymaps"
        end,
    })
end, { bang = false })

command("LegendaryCommands", function()
    legendary.find({
        filters = { filters.commands() },
        select_prompt = function()
            return "Commands"
        end,
    })
end, { bang = false })
