local utils = require "core.utils"

return {
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "bufdelete"),
  },
  {
    "Bekaboo/deadcolumn.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "deadcolumn"),
    opts = {},
    config = function(_, opts)
      require("deadcolumn").setup(utils.create_spec("deadcolumn", opts))
    end,
  },
  {
    "pteroctopus/faster.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "faster"),
    opts = {},
    config = function(_, opts)
      require("faster").setup(utils.create_spec("faster", opts))
    end,
  },
  {
    "folke/flash.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "flash"),
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    ---@type Flash.Config
    opts = {},
    config = function(_, opts)
      require("flash").setup(utils.create_spec("flash", opts))
    end,
  },
  {
    "backdround/global-note.nvim",
    event = "VeryLazy",
    enabled = utils.enabled("plugins", "global-note"),
    opts = {
      filename = "global.norg",
      directory = vim.fn.stdpath "data" .. "/global-note/",
      -- Floating window title.
      -- string or fun(): string
      title = "Todo: " .. os.date "%Y/%m/%d",

      -- Ex command name.
      -- string
      command_name = "GlobalNote",

      -- A nvim_open_win config to show float window.
      -- table or fun(): table
      window_config = function()
        local window_height = vim.api.nvim_list_uis()[1].height
        local window_width = vim.api.nvim_list_uis()[1].width
        return {
          relative = "editor",
          border = "single",
          title = "Note",
          title_pos = "center",
          width = math.floor(0.7 * window_width),
          height = math.floor(0.85 * window_height),
          row = math.floor(0.05 * window_height),
          col = math.floor(0.15 * window_width),
        }
      end,
      -- Additional presets to create other global, project local, file local
      -- and other notes.
      -- { [name]: table } - tables there have the same fields as the current table.
      additional_presets = {},
    },
    config = function(_, opts)
      require("global-note").setup(utils.create_spec("global-note", opts))
    end,
  },
  {
    "theprimeagen/harpoon",
    enabled = utils.enabled("plugins", "harpoon"),
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ha", "<CMD>HarpoonAdd<CR>", desc = "Harpoon File" },
      { "<leader>he", "<CMD>HarpoonMenu<CR>", desc = "Show Harpoons" },
      { "<leader>hh", "<CMD>HarpoonPrev<CR>", desc = "Previous Harpoon" },
      { "<leader>hl", "<CMD>HarpoonPrev<CR>", desc = "Next Harpoon" },
      { "<leader>1", "<CMD>HarpoonSelect 1<CR>", desc = "Goto Harpoon: 1" },
      { "<leader>2", "<CMD>HarpoonSelect 2<CR>", desc = "Goto Harpoon: 2" },
      { "<leader>3", "<CMD>HarpoonSelect 3<CR>", desc = "Goto Harpoon: 3" },
      { "<leader>4", "<CMD>HarpoonSelect 4<CR>", desc = "Goto Harpoon: 4" },
    },
    opts = {},
    config = function(_, opts)
      local harpoon = require "harpoon"

      harpoon:setup(utils.create_spec("harpoon", opts))

      harpoon:extend {
        UI_CREATE = function(ctx)
          utils.map("n", "<C-v>", function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = ctx.buffer })
        end,
      }
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "hlchunk"),
    opts = { blank = { enable = false }, chunk = { chars = { right_arrow = "─" } }, line_num = { enable = false } },
    config = function(_, opts)
      require("hlchunk").setup(utils.create_spec("hlchunk", opts))
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    enabled = utils.enabled("plugins", "neoscroll"),
    opts = {},
    config = function(_, opts)
      require("neoscroll").setup(utils.create_spec("neoscroll", opts))
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    enabled = utils.enabled("plugins", "nvim-highlight-colors"),
    event = "BufReadPre",
    opts = {
      render = "virtual",
      enabled_named_colors = true,
      enabled_tailwind = true,
    },
    config = function(_, opts)
      require("nvim-highlight-colors").setup(utils.create_spec("nvim-highlight-colors", opts))
    end,
  },
  {
    "epwalsh/pomo.nvim",
    enabled = utils.enabled("plugins", "pomo"),
    cmd = { "TimerStart", "TimerRepeat" },
    opts = {
      update_interval = 1000,
      notifiers = {
        {
          name = "Default",
          opts = {
            sticky = true,
          },
        },
      },
    },
    config = function(_, opts)
      require("pomo").setup(utils.create_spec("pomo", opts))
    end,
  },
  {
    "tpope/vim-sleuth",
    enabled = utils.enabled("plugins", "vim-sleuth");
  },
  {
    "folke/todo-comments.nvim",
    enabled = utils.enabled("plugins", "todo-comments"),
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fc", "<CMD>TodoTelescope<CR>", desc = "Find Todo's" },
    },
    opts = {},
    config = function(_, opts)
      require("todo-comments").setup(utils.create_spec("todo-comments", opts))
    end,
  },
  {
    "theprimeagen/vim-apm",
    enabled = utils.enabled("plugins", "vim-apm"),
    keys = {
      {
        "<leader>apm",
        function()
          require("vim-apm"):toggle_monitor()
        end,
        desc = "Toggle Actions Per Minute",
      },
    },
    opts = {
      reporter = {
        type = "memory",
      },
    },
    config = function(_, opts)
      require("vim-apm"):setup(utils.create_spec("vim-apm", opts))
    end,
  },
  {
    "anuvyklack/windows.nvim",
    enabled = utils.enabled("plugins", "windows"),
    event = "VeryLazy",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    opts = {
      autowidth = {
        winwidth = 0.75,
      },
      animation = {
        fps = 60,
        duration = 250,
        easing = "in_out_quad",
      },
    },
    config = function(_, opts)
      vim.o.equalalways = false
      require("windows").setup(utils.create_spec("windows", opts))
    end,
  },
}