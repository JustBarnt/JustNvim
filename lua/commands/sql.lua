--- harlequin
local enabled = require("core.utils").enabled
local api = vim.api

-- Just use harlequin --config 
-- Check if a config exists and if it doesn't run harlequin --config
-- https://github.com/tconbeer/harlequin/releases/tag/v1.16.0

local createInputs = function(fields)
    local inputs = {}
    for prompt, _ in pairs(fields) do
        vim.ui.input({ prompt = prompt }, function(input)
            inputs = table.insert(inputs, input)
        end)
    end
end


-- if vim.fn.executable "harlequin" and enabled("commands", "harlequin") then
--     api.nvim_create_user_command("SqlTUI", function()
--         local fields = {
--             ["Enter Driver: "] = function(value)
--                 return value
--             end,
--             ["Enter DNS: "] = function(value)
--                 return value
--             end,
--             ["Enter Server: "] = function(value)
--                 return value
--             end,
--             ["Enter User: "] = function(value)
--                 return value
--             end,
--             ["Enter Password: "] = function(value)
--                 return value
--             end,
--             ["Enter Database: "] = function(value)
--                 return value
--             end,
--             ["Enter Connection Timeout: "] = function(value)
--                 return value
--             end,
--         }
--     end, { bang = false })
-- end
