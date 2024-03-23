local utils = require "core.utils"
local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd
local clear = { clear = true }

if utils.enabled("autocmds", "disable_auto_comment") then
    cmd("BufEnter", {
        desc = "Disables create an commented new line when going to a new line",
        group = augroup("disable_auto_comment", clear),
        command = [[set formatoptions-=cro]],
    })
end

if utils.enabled("autocmds", "highlight_yank") then
    cmd("TextYankPost", {
        desc = "Highlights text selection when yanking",
        group = augroup("highlight_yank", clear),
        callback = function()
            vim.highlight.on_yank()
        end,
    })
end

if utils.enabled("autocmds", "help_in_float") then
    cmd("BufWinEnter", {
        pattern = "*",
        callback = function(event)
            local filetype = vim.bo[event.buf].filetype
            local file_path = event.match
            local filetypes = { "help", "markdown", "norg", "txt" }

            if file_path:match "/doc/" ~= nil then
                -- Only run if the filetype is a help file
                if vim.tbl_contains(filetypes, filetype) then
                    -- Get the newly opened help window
                    -- and attempt to open a Detour() float
                    local help_win = vim.api.nvim_get_current_win()
                    local ok = require("detour").Detour()

                    -- If we successfully create a float of the help file
                    -- Close the split
                    if ok then
                        vim.api.nvim_win_close(help_win, false)
                    end
                end
            end
        end,
    })
end

if utils.enabled("autocmds", "trailing_whitespace_on_save") then
    print "We triming whitespace boisss"
    cmd({ "BufWritePre" }, {
        desc = "Clears trailing whitespace on save",
        group = augroup("trailing_whitespace", clear),
        pattern = "*",
        command = [[%s/\s\+$//e]],
    })
end

if utils.enabled("autocmds", "format_on_save") then
    cmd({ "BufWritePre" }, {
        desc = "Formats buffer on save",
        group = augroup("format_on_save", clear),
        pattern = "*",
        callback = function(args)
            local conform = require "conform"
            local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
            if filetype ~= "php" or filetype ~= "xml" or filetype ~= "html" or filetype ~= "svelte" then
                conform.format({ bufnr = args.buf, lsp_fallback = false })
            end
        end,
    })
end
