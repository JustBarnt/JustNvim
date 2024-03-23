local utils = require "utils"

return {
    "stevearc/dressing.nvim",
    opts = {
        input = {
            title_pos = "center",
            relative = "editor",

        },
        select = {
            get_config = function(opts)
                local themes = require "telescope.themes"
                local sorters = require "telescope.sorters"
                if opts.kind == "legendary.nvim" then
                    return {
                        telescope = themes.get_dropdown({
                            sorter = sorters.fuzzy_with_index_bias({}),
                        }),
                    }
                elseif opts.kind == "codeaction" then
                    return {
                        telescope = themes.get_cursor({ initial_mode = "normal" }),
                    }
                else
                    return {
                        telescope = themes.get_dropdown({})
                    }
                end
            end,
        },
    },
    config = function(_, opts)
        require("dressing").setup(utils.create_spec("dressing", opts))
    end,
}
