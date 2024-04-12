local utils = require "core.utils"
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "chrisgrieser/cmp-nerdfont",
      "onsails/lspkind-nvim",
    },
    config = function()
      -- Getting required imports from plugins
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"
      local cmp_utils = require "core.utils.cmp"
      -- Distro Related Helpers
      local comparators = require "core.plugins.nvim-cmp.cmp-comparators"
      local mappings = require "core.plugins.nvim-cmp.cmp-mappings"
      local sources = require "core.plugins.nvim-cmp.cmp-sources"
      -- Luasnip Setup
      luasnip.config.setup {}
      ---@class cmp.ConfigSchema
      local config = {
        enabled = function()
          return cmp_utils.is_enabled()
        end,
        preselect = cmp.PreselectMode.Item,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        performance = {
          max_view_entries = 15,
        },
        mapping = mappings.insert(cmp, luasnip),
        sources = sources.editor(),
        experimental = {
          ghost_text = true,
        },
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
          documentation = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = lspkind.cmp_format { mode = "symbol_text", maxwidth = 25 }(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
          end,
        },
      }

      -- Setup autocompletion for LSP and others
      -- Setup autocompletion for search cmdline
      cmp.setup(config)
      cmp.setup.cmdline({ "/", "?" }, { mapping = cmp.mapping.preset.cmdline(), sources = sources.search() })
      cmp.setup.cmdline(
        ":",
        { mapping = cmp.mapping.preset.cmdline(), sources = sources.cmdline(), preselect = cmp.PreselectMode.Item }
      )
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    tag = "v2.2.0",
    dependencies = { "rafamadriz/friendly-snippets", "benfowler/telescope-luasnip.nvim" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load { path = vim.fn.stdpath "config" .. "/snippets" }
      local extends = {
        typescript = { "tsdoc" },
        javascript = { "tsdoc" },
        lua = { "luadoc" },
        cs = { "csharpdoc" },
        c = { "cdoc" },
        cpp = { "cppdoc" },
        php = { "phpdoc" },
        svelte = { "tsdoc", "html" },
      }

      for key, value in pairs(extends) do
        require("luasnip").filetype_extend(key, value)
      end
    end,
  },
}
