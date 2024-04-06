return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    triggers_blacklist = {
      n = { "d", "y" },
    },
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 5,
      },
    },
    window = {
      border = { "", "▔", "", "", "", " ", "", "" },
      margin = { 0, 0, 1, 0 },
      padding = { 0, 0, 0, 0 },
    },
  }, -- Empty opts means default options
  config = function(_, opts)
    local wk = require "which-key"

    wk.setup(opts)
    wk.register {
      ["<leader>"] = {
        name = "Map Leader",
        c = {
          name = "Code",
        },
        d = {
          name = "Directory",
        },
        f = {
          name = "Find",
        },
        h = {
          name = "Harpoon",
        },
        l = {
          name = "Lsp",
        },
        m = {
          name = "Miscellaneous",
        },
        t = {
          name = "Template",
        },
        x = {
          name = "Trouble",
        },
      },
      ["<leader>a"] = { "Actions Per Minute" },
      ["<leader>_"] = { "which_key_ignore" },
      ["<leader>s"] = { "Clear Search Highlights" },
      ["["] = { "Previous Text-Object" },
      ["]"] = { "Next Text-Object" },
      ["<C-w>"] = { "Window" },
      ["g"] = { "Go-To" },
      ["z"] = { "Folds / Center Cursor" },
      ["z="] = { "Spelling Suggestions" },
    }
  end,
}
