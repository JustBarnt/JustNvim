return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        local mini = require("mini.files").setup()

        vim.api.nvim_create_autocmd("User", {
            pattern = "MiniFilesBufferCreate",
            callback = function(ev)
                vim.schedule(function()
                    vim.api.nvim_set_option_value('buftype', "acwrite", { buf = 0})
                    vim.api.nvim_buf_set_name(0, tostring(vim.api.nvim_get_current_win()))
                    vim.api.nvim_create_autocmd("BufWriteCmd", {
                        buffer = ev.data.buf_id,
                        callback = function()
                            require("mini.files").synchronize()
                        end,
                    })
                end)
            end,
        })
    end,
}
