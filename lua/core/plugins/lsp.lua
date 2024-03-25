local enabled = require("core.utils").enabled
local exists, user_config = pcall(require, "user.config")

return {
    {
        "neovim/nvim-lspconfig",
        -- event = "BufReadPre",
        dependencies = {
            { "folke/neodev.nvim", enabled = enabled("plugins", "neodev") },
            { "folke/neoconf.nvim", enabled = enabled("plugins", "neoconf") },
        },
        config = function()
            local defaults = require "core.plugins.lsp.default-config"
            local neodev = vim.F.npcall(require, "neodev")
            local neoconf = vim.F.npcall(require, "neoconf")
            local on_attach = require("core.plugins.lsp.on_attach").on_attach

            if neodev then
                neodev.setup({
                    library = {
                        enabled = true,
                        runtime = vim.env.RUNTIME,
                        plugins = vim.fn.stdpath "data" .. "/lazy/",
                        types = true,
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

            local defaults = require "core.plugins.lsp.default-config"
            local user_servers = exists and type(user_config) == "table" and user_config.servers or {}
            local user_formatters = exists and type(user_config) == "table" and user_config.formatters or {}
            local ensure_installed = vim.tbl_keys(defaults.servers)
            vim.list_extend(ensure_installed, defaults.conform.formatters)
            -- Adding manually because we use typescript-tools.nvim and I do not
            -- want tsserver getting configed because it exists in my lspservers table
            table.insert(ensure_installed, 'tsserver')
            -- TODO: NEED TO FIX USERS EXTENDING SERVER LIST AND FORMATTERS
            -- vim.list_extend(ensure_installed, user_formatters.ensure_installed)
            -- vim.list_extend(defaults.servers, user_servers)
            -- vim.list_extend(defaults.formatters_by_ft, user_formatters.formatters_by_ft)

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
                formatters_by_ft = defaults.conform.formatters_by_ft,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
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
    {
        "luckasRanarison/tailwind-tools.nvim",
        ---@type TailwindTools.Option
        opts = {
            document_color = {
                enabled = true,
                kind = vim.fn.has "nvim-0.10.0-dev" and "inline" or "background"
            }
        },
        config = function(_, opts)
            require("tailwind-tools").setup(opts)
        end,
    }
}
