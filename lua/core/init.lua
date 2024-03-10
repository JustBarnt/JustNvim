-- Load Core Settings
require("core.keymaps").Default()
require "core.options"
require "core.autocmds"
require "core.user-commands"

-- Bootstrap Lazy
-- Creating our lazy install dir, then creating the git clone call
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Appending lazy to our runtime, for lazy magic
vim.opt.rtp:prepend(lazypath)
local lazy = require "lazy"

-- Setting up lazy specs
lazy.setup({
    spec = {
        { import = "core.plugins" },
        { import = "plugins" },
        -- { import = "user.plugins" },
    },
    defaults = {
        dev = {
            path = "~/nvim-plugins/",
            fallback = true,
        },
        change_detection = {
            notify = false,
        },
        performance = {
            rtp = {
                disable_plugins = {
                    "matchit",
                    "matchparan",
                    "netrwPlugin",
                    "zipPlugin",
                },
            },
        },
    },
})

if vim.fn.findfile("./lua/colorscheme.lua") ~= "" then
    require 'lua.colorscheme'
else
    vim.notify_once("No Colorscheme file found, call `:Telescope themes` to set one", vim.log.levels.INFO)
end
