local M = {}

---@param hl Highlights
---@param c ColorScheme
function M.ui_blend(hl, c)
    --[[Neotree]]
    hl.NeoTreeNormalNC = { bg = c.bg }
    hl.NeoTreeNormal = { bg = c.bg }
    hl.NeoTreeTitleBar = { bg = c.bg }
    hl.NeoTreeVertSplit = { bg = c.bg }
    hl.NeoTreeFloatNormal = { bg = "none" }

    --[[Edgy]]
    hl.EdgyNormal = { bg = c.none }
    hl.EdgyTitle = { bg = c.none }
    hl.EdgyWinBar = { bg = c.bg }

    --[[Winbar/Statusline]]
    hl.WinBar = { bg = c.bg }
    hl.WinBarNC = { bg = c.bg }
    hl.StatusLine = { bg = c.bg }
end

---@param hl Highlights
---@param c ColorScheme
function M.seamless_edgy_windows(hl, c) end

---@param hl Highlights
---@param c ColorScheme
function M.borderless_float(hl, c)
    hl.NormalFloat = { bg = c.none }
    hl.WhichKeyFloat = { bg = c.none }
    hl.LazyNormal = { bg = c.none }
end

---@param hl Highlights
---@param c ColorScheme
function M.borderless_telescope(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
    }

    -- Prompt
    hl.TelescopePromptNormal = {
        bg = prompt,
    }
    hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
    }
    hl.TelescopePromptTitle = {
        bg = prompt,
        fg = c.fg_dark,
    }
    -- Preview
    hl.TelescopePreviewNormal = {
        bg = prompt,
        fg = c.fg_dark,
    }
    hl.TelescopePreviewBorder = {
        bg = prompt,
        fg = prompt,
    }
    hl.TelescopePreviewTitle = {
        bg = prompt,
        fg = c.fg_dark,
    }
    -- Results
    hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.fg_dark,
    }
end

return M
