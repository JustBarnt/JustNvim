require "core.user-commands.legendary"

local command = vim.api.nvim_create_user_command

command("EdgyTerm", function()
    local term = require "core.utils.terminal"
    term.edgyterm_toggle()
end, { bang = false })
