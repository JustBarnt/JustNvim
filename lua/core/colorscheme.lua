local rose_pine = require "rose-pine"
local pallets = require "user.theme-colors"

rose_pine.setup({
    -- dim_inactive_windows = true,
    bold_vert_split = true,
    extend_background_behind_borders = false,
    disable_background = true,
    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },
    highlight_groups = {
        ColorColumn = { bg = "rose", blend = 15 },
        FloatBorder = { bg = "none" },

        -- Gitsigns
        GitsignsAdd = { fg = pallets.main.iris },
        GitsignsDelete = { fg = pallets.main.love },
        GitsignsChange = { fg = pallets.main.gold },
        GitsignsUntracked = { fg = pallets.dawn.pine },
        GitsignsTopdelete = { fg = pallets.dawn.love },
        GitsignsChangedelete = { fg = pallets.dawn.rose },

        -- Telescope Start
        TelescopeBorder = { fg = "overlay", bg = "overlay" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

        -- Colors The titles for Telescope
        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "pine" },
        TelescopePreviewTitle = { fg = "base", bg = "iris" },

        -- Colors the Preview window for Telescope
        TelescopePreviewNormal = { fg = "text", bg = pallets.main.surface },
        TelescopePreviewBorder = { fg = pallets.main.surface, bg = pallets.main.surface },

        -- Colors the Prompt window for Telescope
        TelescopePromptNormal = { fg = "text", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },

        CmpItemAbbrDeprecated = { bg = "NONE", gui="strikethrough", fg="#6e6a86"},
        CmpItemAbbrMatch = { bg = "NONE", gui="strikethrough", fg="#31748f"},
        CmpItemAbbrMatchFuzzy = { link ="CmpItemAbbrMatch" },
    },
})

vim.cmd[[
    highlight CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#6e6a86
    highlight CmpItemAbbrMatch guibg=NONE guifg=#31748f
    highlight link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
    highlight CmpItemKindVariable guibg=NONE guifg=#c4a7e7
    highlight link CmpItemKindInterface CmpItemKindVariable
    highlight link CmpItemKindText CmpItemKindVariable
    highlight CmpItemKindFunction guibg=NONE guifg=#ebbcba
    highlight link CmpItemKindMethod CmpItemKindFunction
    highlight CmpItemKindKeyword guibg=NONE guifg=#eb6f92
    highlight link CmpItemKindProperty CmpItemKindKeyword
    highlight link CmpItemKindUnit CmpItemKindKeyword
]]

vim.cmd.colorscheme "rose-pine-moon"
vim.cmd.hi 'Comment gui=none'
