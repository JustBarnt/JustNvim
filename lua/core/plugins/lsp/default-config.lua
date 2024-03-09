local M  = {}

M.formatters = {
    conform = {
        "stylua",
        "prettier",
    },
}

M.servers = {
    bashls = {},
    html = {},
    svelte = {},
    gopls = {},
    cssls = {},
    omnisharp = {},
    lua_ls = require "core.plugin.lsp.servers.lua_ls",
    intelephense = require "core.plugin.lsp.servers.intelephense",
    jsonls = require "core.plugin.lsp.servers.jsonls",
    clangd = require "core.plugin.lsp.servers.clangd",
    powershell_es = require "core.plugin.lsp.servers.powershell_es",
    emmet_language_server = require "core.plugin.lsp.servers.emmet_language_server",
    tailwindcss = {},
}

M.formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    svelte = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
}

return M
