local M = {}

function M.borderless_telescope()
    return {
        -- Telescope Start
        TelescopeBorder = { fg = "overlay", bg = "overlay" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },

        -- Colors The titles for Telescope
        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "pine" },
        TelescopePreviewTitle = { fg = "base", bg = "iris" },

        -- Colors the Preview window for Telescope
        TelescopePreviewNormal = { fg = "text", bg = "surface" },
        TelescopePreviewBorder = { fg = "surface", bg = "surface" },

        -- Colors the Prompt window for Telescope
        TelescopePromptNormal = { fg = "text", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },
    }
end

return M
