return {
    {
        "stevearc/oil.nvim",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = "Oil",
        keys = function()
            local oil = require "oil"
            return {
                { "<leader>de", oil.toggle_float, desc = "Open Directory in Float" },
                { "<leader>do", oil.open, desc = "Open Directory" },
            }
        end,
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
                "permissions",
                "mtime"
            },
            skip_confirm_for_simple_edits = true,
            experimental_watch_for_changes = true,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["s"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name)
                    local hide = false
                    local exclude =
                        { ".git", "node_modules", "build", ".svelte-kit" }
                    for i = 1, #exclude do
                        if name == exclude[i] then
                            hide = true
                        end
                    end

                    return hide
                end,
            },
        },
        config = function(_, opts)
            local oil = require "oil"
            local user_config = require "user.config"
            local config = vim.tbl_deep_extend("force", opts, user_config.oil or {})
            oil.setup(config)
        end,
    },
}
