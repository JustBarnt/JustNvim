return {
    bundle_path = vim.fn.stdpath('data') .. "/mason/packages/powershell-editor-services",
    shell = "pwsh.exe",
    root_dir = function(fname)
        local path = require("lspconfig").util.root_pattern("*_profile.ps1") or "*.ps1"
        return path(fname)
    end,
    single_file_support = true,
}
