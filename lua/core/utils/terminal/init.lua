local M = {}
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "rounded",
    },
    on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
    end,

    on_close = function(_)
        vim.cmd "startinsert!"
    end,
})

local edgyterm = Terminal:new({
    cmd = "pwsh",
    hidden = false,
    dir = vim.fn.getcwd(),
    direction = "horizontal",
})

function M.edgyterm_toggle()
    if edgyterm:is_open() then
        edgyterm:close()
    else
        edgyterm:open()
    end
end

function M.lazygit_toggle()
    lazygit:toggle()
end

return M
