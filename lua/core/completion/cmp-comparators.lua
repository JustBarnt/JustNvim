local M = {}

function M.compare(cmp)
    return {
        -- deprioritize_snippet,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        cmp.config.compare.order,
    }
end

return M
