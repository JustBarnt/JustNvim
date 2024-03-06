local actions = require "telescope.actions"
local trouble = require "trouble.providers.telescope"
local M = {}

-- NOTE: Config is for enabling and disabling item.
-- TODO: Create object for colorscheme override
-- TODO: Add options override here as well.
-- Delete all options that are currently default as well, it tech debt and uneccessary
M.user_options = {
    opt = {
        -- Editor / Command options
        number = true,
        relativenumber = true,
        scrolloff = 10, -- Amount of lines below curor
        pumblend = 17,
    },
}

M.user_commands = {
    quit_all = true,
    format = true,
    telescope_highlight_tags = true,
}

M.autocmds = {
    --TODO: Add keybind that disables and enables this
    disable_auto_comment = false,
    dashboard_start = true,
    help_in_float = true,
    highlight_yank = true,
    cursor_line = true,
    cursor_line_control = true,
    trailing_whitespace = false,
    show_message_float = true,
}

--Overwrite default installed formatters, lsps, parsers
M.ensure_installed = {
    conform = {
        "stylua",
        "prettier",
    },
    mason_lspconfig = {
        "bashls",
        "cssls",
        "clangd",
        "emmet_language_server",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "omnisharp",
        "powershell_es",
        "svelte",
        "tailwindcss",
        "taplo",
    },
    parsers = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "c_sharp",
        "go",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "regex",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
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
    -- tsserver = require "core.lsp.servers.tsserver",
}

M.formatters = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
}

M.harpoon = {
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
}

M.neoscroll = {
    respect_scrolloff = true,
}

M.treesitter = {
    Highlight = {
        enable = true,

        -- TODO: Create Queries for Svelte the highlight/indent queries for special blocks don't seem to match
        -- NOTE: May need to enable for Svelte to get it to respect Svelte Special blocks
        -- NOTE: https://github.com/Himujjal/tree-sitter-svelte?tab=readme-ov-file#for-neovim-peeps
        additional_vim_regex_highlighting = false,
    },

    Refactor = {
        highlight_definitions = {
            enable = true,
            disable = { "xml" },
            clear_on_cursor_move = true,
        },

        highlight_current_scope = { enable = false },

        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "<leader>cR",
            },
        },

        navigation = false,

        incremental_selection = {
            enable = true,
        },
    },

    Textobjects = {
        move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
                ["]p"] = "@parameter.inner",
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[p"] = "@parameter.inner",
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },

        select = {
            enable = true,

            -- Jump forward automatically like targets.vim
            lookahead = true,

            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",

                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",

                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",

                ["av"] = "@variable.outer",
                ["iv"] = "@variable.inner",
            },
        },
    },
}

M.telescope = {
    defaults = {
        initial_mode = "insert",
    },
    extensions = {
        -- ["ui-select"] = {
        --     require("telescope.themes").get_cursor({ initial_mode = "normal" }),
        -- },
        cmdline = {
            picker = {
                initial_mode = "normal",
                layout_config = {
                    width = 60,
                    height = 10,
                },
            },
        },
    },
    pickers = {
        buffers = {
            initial_mode = "normal",
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                    ["<c-q>"] = actions.close,
                },
                n = {
                    ["d"] = actions.delete_buffer,
                },
            },
        },
        find_files = require("core.utils").select_find_command(), --vim.fn.executable == 1 and { "fd", "--strip-cwd-prefix", "--type", "f" } or nil,
    },
}

return M
