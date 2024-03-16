local enabled = require("utils").enabled

if enabled("commands", "quit_all") then
    vim.api.nvim_create_user_command("Q", function()
        vim.cmd [[:qall!]]
    end, { bang = true, desc = "Quit All without Saving" })
end

if enabled("commands", "format") then
    vim.api.nvim_create_user_command("LspFormat", function()
        require("conform").format({ async = true, lsp_fallback = false })
    end, { bang = false })
end

if enabled("commands", 'show_message_float') then
    vim.api.nvim_create_user_command("ShowMessageFloat", function()
        vim.cmd.Bmessages()
        local message_split = vim.api.nvim_get_current_win()

        local ok = require('detour').Detour()
        if ok then
            vim.api.nvim_win_close(message_split, false)
        end
    end, {desc = "Show Scratch Messages in Float"})
end
