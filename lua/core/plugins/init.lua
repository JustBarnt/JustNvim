local UI = {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "linrongbin16/lsp-progress.nvim",
      "abeldekat/harpoonline",
    },
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.lualine")
    end,
  },
  {
    "DNLHC/glance.nvim",
    event = "BufEnter",
    config = function()
      require("core.plugins.configs.glance")
    end,
  },
}

local EDITOR = {
  {
    "nvim-telescope/telescope.nvim",
    commit = "7d1698f",
    -- branch = "0.1.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "andrew-george/telescope-themes",
      "d00h/telescope-any",
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
      require("core.plugins.configs.telescope")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufEnter",
    config = true,
  },
  {
    "cbochs/grapple.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "Grapple" },
    keys = {
      { "<leader>m", "<CMD>Grapple toggle<CR>", desc = "Tag Current File" },
      { "<leader>M", "<CMD>Grapple toggle_tags<CR>", desc = "Toggle Tags Menu" },
      { "<leader>1", "<CMD>Grapple select index=1<CR>", desc = "Select Tag 1" },
      { "<leader>2", "<CMD>Grapple select index=2<CR>", desc = "Select Tag 2" },
      { "<leader>3", "<CMD>Grapple select index=3<CR>", desc = "Select Tag 3" },
      { "<leader>4", "<CMD>Grapple select index=4<CR>", desc = "Select Tag 4" },
      { "<leader>mn", "<CMD>Grapple cycle_tags next<CR>", desc = "Go-To Next Tag" },
      { "<leader>mp", "<CMD>Grapple cycle_tags prev<CR>", desc = "Go-To Previous Tag" },
    },
    dependencies = {
      {
        "cbochs/portal.nvim",
        cmd = { "Portal" },
        keys = {
          { "<leader>Mn", "<CMD>Portal grapple forward<CR>", desc = "Portal Grapple Next" },
          { "<leader>Mp", "<CMD>Portal grapple backward<CR>", desc = "Portal Grapple Next" },
        },
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("core.plugins.configs.grapple")
    end,
  },
}

local THEMES = {}

local CODING = {}
return { UI, EDITOR }