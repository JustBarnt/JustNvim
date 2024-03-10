return {
    root_dir = require("lspconfig.util").root_pattern(
        "lua",
        ".stylua.toml",
        "lazy-lock.json",
        ".neoconf.json",
        "neoconf.json"
    ),
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                disable = {
                    "incomplete-signature-doc",
                    "missing-fields",
                },
                globals = {
                    "vim",
                },
                unusedLocalExclude = { "_*" },
            },
        },
    },
}
