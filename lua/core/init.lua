-- Bootstrap Lazy
-- Creating our lazy install dir, then creating the git clone call
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy = require "lazy"
---@class LazySpec
-- TODO: For integrating VSCODE support to load only plugins it needs
--       https://github.com/isaksamsten/nvim-config/blob/e6eac29e17df6a2314f109d74952331cb52b2a00/lua/config/lazy.lua#L13
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

vim.notify = require "notify"

if vim.fn.findfile(vim.fn.stdpath "config" .. "/lua/colorscheme.lua") ~= "" then
  require "colorscheme"
else
  vim.notify_once(
    "No Colorscheme file found: Defaulting to `tokyonight`, call `:Telescope themes` to set one",
    vim.log.levels.INFO
  )
  vim.cmd [[colorscheme tokyonight-storm]]
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    require "core.options"
  end,
})

vim.schedule(function()
  require "core.keymaps"
  require "core.autocmds"
  require "core.user-commands"
  require "extras.commands"
  require "extras.autocmds"
end)
