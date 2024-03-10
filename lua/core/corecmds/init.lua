local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

--- Starts Oil on VimEnter (This allows me to lazy load and set keymaps in lazy spec which prevents this from opening cause it gets lazy loaded)
autocmd("VimEnter", {
    callback = vim.schedule_wrap(function(data)
        if data.file == "" or vim.fn.isdirectory(data.file) ~= 0 then
            require('oil').open()
        end
    end)
})
