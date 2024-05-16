local utils = require("core.utils")

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    enabled = utils.enabled("plugins", "nvim-autopairs"),
    opts = {
      disable_filetype = { "TelescopePrompt", "spectre_panel", "neo-tree" },
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(utils.create_spec("nvim-autopairs", opts))
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    enabled = utils.enabled("plugins", "inc-rename"),
    command = "IncRename",
    opts = {
      -- hl_group = "Substitute",
      -- input_buffer_type = "dressing",
    },
    config = function(_, opts)
      require("inc_rename").setup(utils.create_spec("inc-rename", opts))
    end,
  },
  {
    "danymat/neogen",
    enabled = utils.enabled("plugins", "neogen"),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Neogen",
    keys = function()
      local neogen = require("neogen")
      return {
        {
          "<leader>td",
          function()
            neogen.generate { snippet_engine = "luasnip" }
          end,
          desc = "Generate Docs from Snippet",
        },
      }
    end,
    opts = {
      snippet_engine = "luasnip",
    },
    config = function(_, opts)
      require("neogen").setup(utils.create_spec("neogen", opts))
    end,
  },
  {
    "justbarnt/nvim-cheatsh",
    enabled = utils.enabled("plugins", "nvim-cheatsh"),
    cmd = { "Cheat", "CheatClose", "CheatList" },
    opts = {
      cheatsh_url = "cht.sh/",
    },
    keys = {
      { "<leader>cs", "<CMD>CheatList<CR>", desc = "Search Cheat Sheets" },
    },
    config = function(_, opts)
      require("nvim-cheatsh").setup(utils.create_spec("nvim-cheatsh", opts))
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    enabled = utils.enabled("plugins", "nvim-surround"),
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-surround").setup(utils.create_spec("nvim-surround", opts))
    end,
  },
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "treesj"),
    opts = {},
    config = function(_, opts)
      require("treesj").setup(utils.create_spec("treesj", opts))
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    enabled = utils.enabled("plugins", "ts-error-translator"),
    ft = { "ts", "svelte" },
    event = "BufReadPre",
    opts = {},
  },
}
