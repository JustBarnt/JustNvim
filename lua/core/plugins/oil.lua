local utils = require 'utils'
return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            float = {
                border = "none"
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = function()
                    local oil = require 'oil'
                    ---@type oil.Entry|nil
                    local entry = oil.get_cursor_entry()
                    local path = oil.get_current_dir()
                    ---@diagnostic disable-next-line: need-check-nil
                    local file_path = path .. entry.name

                    if entry and entry.type == "directory" then
                        return oil.select()
                    elseif entry and entry.type == "file" then
                        return oil.select( {horizontal = true} )
                        -- local target_win = utils.get_window_location("right")
                        -- local buf = vim.api.nvim_create_buf(true, false)
                        -- local filetype = entry.name:match("%.([^%.]+)$")
                        -- local file_contents = vim.fn.readfile(file_path)
                        --
                        -- vim.api.nvim_buf_set_lines(buf, 0, -1, false, file_contents)
                        -- vim.api.nvim_set_option_value("filetype", filetype, { buf = buf })
                        -- vim.api.nvim_buf_set_name(buf, vim.fs.normalize(path .. entry.name))
                        -- vim.api.nvim_win_set_buf(target_win, buf)
                    end
                end,
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-p>"] = "actions.preview",
                ["<C-s>"] = "actions.save",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
                -- ["q"] = "actions.close",

            },
            use_default_keymaps = false,
            buf_options = {
                buflisted = false,
            },
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name)
                    local hide = false
                    local exclude = { ".git", "node_modules", "build", ".svelte-kit", ".." }
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
            local map = require("utils").map
            map("n", "<leader>de", oil.toggle_float, { desc = "Open Directory in Float" })
            map("n", "<leader>do", "<CMD> vsplit | Oil<CR>", { desc = "Open Directory"})

            oil.setup(utils.create_spec('oil', opts))
        end,
    },
}
