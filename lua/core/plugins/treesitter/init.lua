local utils = require "core.utils"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
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
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml", "svelte", "php", "ctp" },
      },
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },

      refactor = {
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
      textobjects = {
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
    },
    config = function(_, opts)
      local ts = require "nvim-treesitter.configs"
      ts.setup(utils.create_spec("nvim-treesitter", opts))
    end,
  },
}
