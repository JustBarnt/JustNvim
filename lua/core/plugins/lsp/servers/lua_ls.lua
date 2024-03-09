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
            telemetry = { enable = false },
            completion = {
                workspaceWord = true,
                callSnippet = "Both",
            },
            hint = {
                enable = true,
            },
            hover = {
                expandAlias = false,
            },
            diagnostics = {
                disable = {
                    "incomplete-signature-doc",
                    "missing-fields",
                },
                global = {
                    "vim",
                },
                unusedLocalExclude = { "_*" },
            },
        },
    },
}
