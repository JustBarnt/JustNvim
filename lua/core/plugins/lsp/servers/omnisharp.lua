local borders = require 'core.lsp.utils'.rounded_border_handlers
local omnisharp_bin = vim.fn.stdpath("data") .. "\\mason\\packages\\omnisharp\\libexec\\Omnisharp.dll"
local pid = vim.fn.getpid()

--[[
    Make sure an .omnisharp.json file exists in ~./omnisharp/.omnisharp.json with at least the following snippets
    {
      "RoslynExtensionsOptions": {
        "enableDecompilationSupport": true
      }
    }
]]

return {
	handlers = vim.tbl_extend("force", borders, {
        ["textDocument/definition"] = require("omnisharp_extended").handler
    }),
}
