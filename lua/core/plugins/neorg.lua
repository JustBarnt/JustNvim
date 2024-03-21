return {
    "nvim-neorg/neorg",
    lazy = false,
    build = ":Neorg sync-parsers",
    -- tag = "v7.0.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.itero"] = {},
            -- ["core.ui.calendar"] = vim.fn.has "nvim-0.10.0-dev" and {} or nil,
            ["core.concealer"] = {
                config = {
                    icon_preset = "diamond",
                    icons = {
                        code_block = {
                            conceal = true,
                            content_only = true,
                            highlight = "CursorLine",
                        },
                    },
                },
            },
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                    name = "[Neorg]"
                },
            },
            ["core.integrations.treesitter"] = {
                config = {
                    parser_configs = {
                        norg = {
                            branch = "main",
                            files = { "src/parser.c", "src/scanner.cc" },
                            url = "https://github.com/nvim-neorg/tree-sitter-norg",
                            revision = "014073fe8016d1ac440c51d22c77e3765d8f6855",
                        },
                    },
                },
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/CommSys/Work",
                        personal = "~/personal",
                    },
                    autodetect = true,
                    autochdir = true,
                },
            },
            ["core.esupports.metagen"] = {
                config = {
                    type = "auto",
                },
            },
        },
    },
}
