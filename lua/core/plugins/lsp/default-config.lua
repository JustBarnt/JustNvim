local M = {}

M.conform = {
  formatters = {
    "stylua",
    "prettierd",
    "prettier",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    svelte = { "prettierd" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
  },
}

M.servers = {
  bashls = {},
  html = {},
  svelte = {},
  gopls = {},
  cssls = {},
  omnisharp = {},
  lua_ls = require "core.plugins.lsp.servers.lua_ls",
  intelephense = require "core.plugins.lsp.servers.intelephense",
  jsonls = require "core.plugins.lsp.servers.jsonls",
  clangd = require "core.plugins.lsp.servers.clangd",
  powershell_es = require "core.plugins.lsp.servers.powershell_es",
  emmet_language_server = require "core.plugins.lsp.servers.emmet_language_server",
  yamlls = require "core.plugins.lsp.servers.yamlls",
  tailwindcss = {},
}

return M
