local utils = require "core.utils"

return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
      { "piersolenski/telescope-import.nvim", enabled = vim.fn.executable "rg" == 1 },
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "andrew-george/telescope-themes",
      "debugloop/telescope-undo.nvim",
    },
    keys = function()
      local builtin = require "telescope.builtin"
      local tele_utils = require "core.utils.telescope"
      return {
        { "<leader>sr", "<CMD>Telescope frecency workspace=CWD<CR>", desc = "Search Recent Telescopes" },
        { "<leader>sh", builtin.help_tags, desc = "Search Help Tags" },
        { "<leader>ss", builtin.builtin, desc = "Search Telescope Builtins" },
        { "<leader>so", builtin.oldfiles, desc = "Search Oldfiles" },
        { "<leader>st", "<CMD>Telescope themes<CR>", desc = "Search Themes" },
        { "<leader><leader>", builtin.buffers, desc = "Search Buffers" },
        { "<leader>sk", "<CMD>LegendaryKeymaps<CR>", desc = "Search Keymaps" },
        { "<leader>sc", "<CMD>LegendaryCommands<CR>", desc = "Search Commands" },
        { "<leader>si", "<CMD>Telescope import<CR>", desc = "Search Module Imports" },
        { "<leader>su", "<CMD>Telescope undo<CR>", desc = "Search UndoTree" },
        {
          "<leader>sf",
          function()
            builtin.find_files {
              hidden = true,
              no_ignore = true,
              file_ignore_patterns = {
                "node_modules/",
                ".git/",
                ".svn/",
                ".svelte-kit/",
                "build/",
              },
              find_command = tele_utils.select_find_command(),
            }
          end,
          desc = "Search Files",
        },
        {
          "<leader>sg",
          function()
            if vim.fn.executable "fd" or vim.fn.executable "fdfind" == 1 then
              builtin.find_files {
                hidden = false,
                no_ignore = true,
                find_command = tele_utils.search_for_repos(),
              }
            else
              vim.notify("Do you have FD installed?", vim.log.levels.WARN)
            end
          end,
          desc = "Search Git Projects",
        },
        {
          "<leader>sw",
          function()
            builtin.grep_string { search = vim.fn.expand "<cword>" }
          end,
          desc = "Search for Word Under Cursor",
        },
        {
          "<leader>sW",
          function()
            builtin.grep_string { search = vim.fn.expand "<cWORD>" }
          end,
          desc = "Search for Word Under Cursor",
        },
        {
          "<leader>sp",
          function()
            builtin.grep_string {
              search = vim.fn.input { prompt = "Grep > " },
            }
          end,
          desc = "Search by Grep",
        },
        {
          "<leader>/",
          function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end,
          desc = "[/] Fuzzy Search Current Buffer",
        },
        {
          "<leader>s/",
          function()
            builtin.live_grep {
              grep_open_files = true,
              prompt_title = "Live Grep in Open Files",
            }
          end,
          desc = "Search in Open files",
        },
      }
    end,
    opts = function()
      local actions = require "telescope.actions"
      local tele_utils = require "core.utils.telescope"
      local open_with_trouble = require("trouble.sources.telescope").open

      return {
        defaults = {
          mappings = {
            i = {
              ["<C-t>"] = open_with_trouble,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-t>"] = open_with_trouble,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          themes = {
            require("telescope.themes").get_dropdown {
              layout_config = {
                width = 120,
                height = 60,
              },
            },
            enable_live_preview = true,
            persist = {
              enabled = true,
              path = vim.fn.stdpath "config" .. "/lua/colorscheme.lua",
            },
          },
          import = {
            custom_languages = {
              {
                regex = [[\s{4,}?(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
                filetypes = { "svelte" },
                extensions = { "svelte" },
              },
            },
          },
          undo = {
            use_delta = false,
          },
          pomodori = {
            timers = require("telescope.themes").get_ivy(),
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
              n = {
                ["d"] = actions.delete_buffer,
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      local exists, config = pcall(require, "user.config")
      ---@class JustNvimTelescope
      local user_config = exists and type(config) == "table" and config.telescope or {}
      local telescope_config = vim.tbl_deep_extend("force", opts, user_config)

      telescope.setup(telescope_config)

      -- TODO: pcall require theses incase they get disabled
      pcall(telescope.load_extension, "themes")
      pcall(telescope.load_extension, "luasnip")
      pcall(telescope.load_extension, "undo")
      pcall(telescope.load_extension, "noice")
      pcall(telescope.load_extension, "pomodori")
      pcall(telescope.load_extension, "import")
    end,
  },
}
