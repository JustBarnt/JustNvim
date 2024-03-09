local neorg = require "neorg"
local neorg_callbacks = require "neorg.core.callbacks"

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.itero"] = {},
        -- ["core.ui.calendar"] = {},
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
            },
        },
        ["core.integrations.treesitter"] = {
            config = {
                parser_configs = {
                    norg = {
                        branch = "main",
                        files = { "src/parser.c", "src/scanner.cc"},
                        url = "https://github.com/nvim-neorg/tree-sitter-norg",
                        revision = '014073fe8016d1ac440c51d22c77e3765d8f6855'
                    }
                }
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/CommSys/Work",
                    personal = "~/personal",
                },
            },
        },
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
    },
})

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'},{
    pattern = {"*.norg"},
    command = [[
        set conceallevel=3
        set concealcursor=nc
    ]]
})
