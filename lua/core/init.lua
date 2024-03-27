-- Load Core Settings
require "core.options"

-- Bootstrap Neovim to work with poweshell if we are on Windows
if vim.fn.has "win32" then
    local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
    }

    -- Attempt to load user profile if it exists
    if
        vim.fn.executable "pwsh" == 1
        and vim.fs.find("Microsoft.PowerShell_profile.ps1", { path = "~/Documents/PowerShell" }) ~= {}
    then
        powershell_options.shellcmdflag =
            "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    end

    for option, value in pairs(powershell_options) do
        vim.opt[option] = value
    end
end

-- Bootstrap Lazy
-- Creating our lazy install dir, then creating the git clone call
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"
---@class LazySpec
local plugins_spec = { { import = "core.plugins" }, { import = "plugins" }, {
    "justinsgithub/wezterm-types",
} }
---@class LazyConfig
local opts = {
    dev = {
        path = "~/nvim-plugins/",
        fallback = true,
    },
    install = {
        colorscheme = { "tokyonight" },
    },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disable_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
}

if vim.fn.isdirectory "lua/user/plugins" == 1 then
    table.insert(plugins_spec, { import = "user.plugins" })
end

-- Setting up lazy specs
lazy.setup(plugins_spec, opts)

if vim.fn.findfile(vim.fn.stdpath "config" .. "/lua/colorscheme.lua") ~= "" then
    require "colorscheme"
else
    vim.notify_once("No Colorscheme file found, call `:Telescope themes` to set one", vim.log.levels.INFO)
end

require "core.keymaps"
require "core.autocmds"
require "core.user-commands"
require "extras.commands"
require "extras.autocmds"
