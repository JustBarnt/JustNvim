local M = {}

-- Override LSP diagnostics support if its supported.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = { min = "Warning" },
    underline = { min = "Warning" },
    virtual_text = { min = "Warning" },
})

local signs = { Error = "", Warn = "", Hint = "", Info = ""}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign"..type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local on_list = function(options)
    vim.fn.setqflist({}, " ", options)
    vim.api.nvim_command "cfirst"
end

M.on_list = on_list
return M
