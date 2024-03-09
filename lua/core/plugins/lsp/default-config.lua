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
    omnisharp = require "core.lsp.servers.omnisharp",
    lua_ls = require "core.lsp.servers.lua_ls",
    intelephense = require "core.lsp.servers.intelephense",
    jsonls = require "core.lsp.servers.jsonls",
    clangd = require "core.lsp.servers.clangd",
    powershell_es = require "core.lsp.servers.powershell_es",
    emmet_language_server = require "core.lsp.servers.emmet_language_server",
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
