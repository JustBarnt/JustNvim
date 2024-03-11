local enabled = require('core.utils').enabled
local user_config = require('user.config')


return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "folke/neodev.nvim", enabled = enabled(user_config.plugins or {}, 'neodev') },
            { "folke/neoconf.nvim", enabled = enabled(user_config.plugins or {}, 'neoconf') },
        },
        config = function()
            local neodev = vim.F.npcall(require, 'neodev')
            local neoconf = vim.F.npcall(require, 'neoconf')
            local defaults = require "core.plugins.lsp.default-config"
            local on_attach = require("core.plugins.lsp.on_attach").on_attach
            local ensure_installed = vim.tbl_keys(defaults.servers)


            if neodev then
                neodev.setup({
                    library = {
                        enabled = true,
                        runtime = vim.env.RUNTIME,
                        plugins = vim.fn.stdpath "data" .. "/lazy/",
                    },
                    lspconfig = true,
                    pathStrict = true,
                })
            end

            if neoconf then
                neoconf.setup({})
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
                callback = function(event)
                    on_attach(event)
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            require("mason").setup()
            vim.list_extend(ensure_installed, defaults.formatters.conform)
            vim.list_extend(defaults.servers, user_config.servers or {})
            vim.list_extend(defaults.formatters_by_ft, user_config.formatters_by_ft or {})

            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = defaults.servers[server_name] or {}
                        require("lspconfig")[server_name].setup({
                            cmd = server.cmd,
                            settings = server.settings,
                            filetypes = server.filetypes,
                            root_dir = server.root_dir,
                            capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
                        })
                    end,
                },
            })

            require("typescript-tools").setup({})

            require("conform").setup({
                notify_on_error = false,
                formatters_by_ft = defaults.formatters_by_ft,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUpdate",
            "MasonLog",
            "MasonUninstall",
            "MasonUninstallAll",
        },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "pmizio/typescript-tools.nvim",
            "b0o/schemastore.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim",
            "nanotee/sqls.nvim",
        },
    },
    "stevearc/conform.nvim",
}
