-- Jump Directly to first definition available every time
vim.lsp.handlers['textDocument/definition'] = function(_, result)
    if not result or vim.tbl_isempty(result) then
        print("[LSP] Could not find definition")
    end
    require('detour').Detour()

    if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1], "utf-8", false)
    else
        vim.lsp.util.jump_to_location(result, "utf-8", false)
    end
end

-- Override LSP diagnostics support if its supported.
vim.lsp.handlers['textDocument/publishDiagnostics'] =
vim.lsp.with(vim.lsp.handlers['textDocument/publishDiagnostics'], {
    signs = { severity_limit = "Error" },
    underline = { severity_limit = "Warning" },
    virtual_text = true,
})

-- TODO: Implement show_message
vim.lsp.handlers["window/showMessage"] = require 'core.lsp.message'