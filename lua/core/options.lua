local vim_opts = require("core.utils").vim_options

vim.opt.shortmess = {
    a = true,
    c = true, -- Do not show completion messages
    F = true, -- Do not show file info when editing
    W = true, -- Do not show "written" -> when saving file
    I = true, -- do not show intro message
}

vim_opts({
    ---@class vim.opt
    opt = {
        foldenable = false,
        numberwidth = 2,
        relativenumber = true,
        number = true,
        pumblend = 17,
        wildmode = "longest:full",
        wildoptions = "pum",
        termguicolors = true,
        backup = false,
        showmode = false,
        showcmd = true,
        cmdheight = 1,
        incsearch = true,
        showmatch = true,
        ignorecase = true,
        smartcase = true,
        hidden = false,
        equalalways = false,
        splitkeep = "screen",
        splitright = true,
        splitbelow = true,
        updatetime = 250,
        timeoutlen = 300,
        hlsearch = true,
        scrolloff = 10,
        cursorline = false,
        autoindent = true,
        cindent = true,
        wrap = false,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        expandtab = true,
        breakindent = true,
        belloff = "all",
        clipboard = "unnamedplus",
        inccommand = "split",
        swapfile = false,
        mouse = "a",
        joinspaces = false,
        list = true,
        listchars = { tab = "» ", trail = "·", nbsp = "␣" },
        undodir = vim.fn.stdpath "state" .. "\\undotree\\",
        undofile = true,
        signcolumn = "yes",
        colorcolumn = "",
    },
})

local exist, config = pcall(require, "user.config")
local opts = exist and type(config) == "table" and config.user_options or {}
vim_opts(opts)
