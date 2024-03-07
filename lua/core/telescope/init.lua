local map = require("core.utils").map
local builtin = require "telescope.builtin"
local telescope = require "telescope"
local exists, user_config = pcall(require, "user.config")
local config = exists and type(user_config) == "table" and user_config.telescope or {}

telescope.setup(config)
telescope.load_extension "themes"
telescope.load_extension "cmdline"

--Basic Telescope builtin
--see :h Telescope.builtin
map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
map("n", "<leader>fk", function() builtin.keymaps({ show_plug = false}) end, { desc = "Find Keymaps" })
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fs", builtin.builtin, { desc = "Find Telescope Builtins" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word in File " })
map("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "Find Resume last Telescope Session" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find Oldfiles" })
map("n", "<leader>ft", "<CMD>Telescope themes<CR>", { desc = "Find Themes"})
map("n", "<leader><leader>", builtin.buffers, { desc = "Find Buffers" })

-- Advanced Telescope mappings
map("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown{
        winblend = 10,
        previewer = false,
    })
end, {desc = "[/] Fuzzy Search Current Buffer"})

map("n", "<leader>f/", function()
    builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "Find in Open files"})
