local utils = require "core.utils"

vim.api.nvim_create_autocmd("BufWinEnter", {
    desc = "Swaps default quickfix window for troubles",
    callback = function()
        local ok, trouble = pcall(require, 'trouble')
        if ok then
            vim.defer_fn(function()
                vim.cmd('cclose')
                trouble.open('quickfix')
            end, 0)
        end
    end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
    desc = "Disables Several plugins when loading large files",
    callback = function(event)
        local cmp_ok, cmp = pcall(require, "cmp")
        local ts_ok, treesitter = pcall(require, "nvim-treesitter.configs")
        local ts_modules = {
            "highlight",
            "incremental_selection",
            "textobjects.select",
            "textobjects.move",
            "textobjects.swap",
            "textobjects.lsp_interop",
            "refactor.highlight_definitions",
            "refactor.highlight_current_scope",
            "refactor.smart_rename",
        }

        if utils.is_large_buffer(event.buf, 1000) then
            if cmp_ok and cmp then
                cmp.setup.buffer({
                    enabled = false,
                })
            end

            if ts_ok and treesitter then
                local disabled = "Large Buffer Detected:\nThe follow treesitter modules have been disabled for performance"
                for _, ts_module in ipairs(ts_modules) do
                    treesitter.detach_module(ts_module, event.buf)
                    disabled = disabled .. "\n\t" .. ts_module
                    vim.treesitter.stop(event.buf)
                end
                vim.notify(disabled, vim.log.levels.INFO)
            end
        end
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Updates Lualine theme if applicable",
    ---@diagnostic disable-next-line: unused-local
    callback = function(event)
        local color = vim.g.colors_name
        local success, _ = pcall(require, "lualine.themes." .. color)
        local lualine_config = require("lualine.config").get_config()
        local updated_config = { options = { theme = success and color or "auto" } }

        require("lualine.config").apply_configuration(vim.tbl_deep_extend("force", lualine_config, updated_config))
    end,
})
