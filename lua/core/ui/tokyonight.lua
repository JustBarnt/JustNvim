local M = {}

---@param hl Highlights
---@param c ColorScheme
function M.overrides(hl, c)
    hl.MsgArea = { bg = c.bg_dark, fg = c.fg_dark }
    hl.SpecialCmpBorder = { bg = c.bg }
    hl.Pmenu = { bg = c.bg }
    -- Tree
    hl.NeoTreeNormalNC = { bg = c.bg }
    hl.NeoTreeNormal = { bg = c.bg }
    hl.NeoTreeTitleBar = { bg = c.bg }
    hl.NeoTreeVertSplit = { bg = c.bg }
    -- Edgy
    hl.EdgyNormal = { bg = c.none }
    hl.EdgyTitle = { bg = c.none }
    hl.EdgyWinBar = { bg = c.bg }
    -- Window
    hl.WinBar = { bg = c.bg }
    hl.WinBarNC = { bg = c.bg }
    hl.StatusLine = { bg = c.bg }
    -- Flash
    hl.FlashBackdrop = {}
    hl.FlashLabel = { bg = c.bg_dark, fg = c.purple }
    -- Telescope
    local prompt = "#2d3149"
    hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
    hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
    hl.TelescopePromptNormal = { bg = prompt }
    hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
    hl.TelescopePromptTitle = { bg = prompt, fg = c.fg_dark }
    hl.TelescopePreviewNormal = { bg = prompt, fg = c.fg_dark }
    hl.TelescopePreviewBorder = { bg = prompt, fg = prompt }
    hl.TelescopePreviewTitle = { bg = prompt, fg = c.fg_dark }
    hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.fg_dark }
end

return M
