local M = {}

function M.borderless_float(hl, c)
    hl.NormalFloat = { bg = "none" }
    hl.WhichKeyFloat = { bg = "none" }
    hl.LazyNormal = { bg = c.bg_dark }
end

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
