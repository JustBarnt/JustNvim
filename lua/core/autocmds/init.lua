local utils = require "core.utils"

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.g.minialign_disable = true
        vim.g.minicursorword_disable = true
        vim.g.miniindentscope_disable = true
        vim.g.minimisc_disable = true
        vim.g.minimove_disable = true
        vim.g.minioperators_disable = true
        vim.g.minipairs_disable = true
        vim.g.minisplitjoin_disable = true
        vim.g.minisurround_disable = true
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
                local disabled =
                    "Large Buffer Detected:\nThe follow treesitter modules have been disabled for performance"
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
