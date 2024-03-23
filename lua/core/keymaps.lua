local map = require("core.utils").map

local M = {}

M.Default = function()
    -- Paste from register
    map("i", "<C-v>", '<C-r>"', { desc = "Insert Mode Paste" })

    -- Move to the Start / End of a line without leaving insert mode
    map("i", "<C-b>", "<C-o>0", { desc = "Jump to front of line" })
    map("i", "<C-a>", "<C-o>A", { desc = "Jump to end of line" })

    -- Prevent macro keybinds
    map("n", "Q", "<NOP>")
    map("n", "q", "<NOP>")
    map("n", "q", function()
        -- Closes a floating window
        local win_id = vim.api.nvim_get_current_win()

        if vim.api.nvim_win_get_config(win_id).zindex then
            vim.api.nvim_win_close(win_id, true)
        elseif #vim.api.nvim_list_wins() >= 2 and vim.api.nvim_get_current_win() ~= vim.api.nvim_list_wins()[1] then
            vim.api.nvim_win_close(win_id, false)
        end
    end, { desc = "Close Float/Window", noremap = true })

    -- Disable use of Arrow Keys: use (HJKL)
    map("n", "<Left>", "<NOP>")
    map("n", "<Down>", "<NOP>")
    map("n", "<Up>", "<NOP>")
    map("n", "<Right>", "<NOP>")

    -- Fix descrepancy between nvim builtin matching (%) and nvim-comment plugin
    map("n", "<leader>_gc", "<CMD>call CommentOperator(visualmode())<CR>")

    -- Center cursor when navigating search results
    map("n", "n", "nzz")
    map("n", "N", "Nzz")

    -- Paste Above / Below Current Line
    map("n", "<leader>p", "o<C-c>p==", { desc = "Paste Below" })
    map("n", "<leader>P", "O<C-c>P==", { desc = "Paste Above" })

    -- Moving Between Panes: Terminal, Split panes, etc.
    map({ "n", "t" }, "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move Pane: Left" })
    map({ "n", "t" }, "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move Pane: Down" })
    map({ "n", "t" }, "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move Pane: Up" })
    map({ "n", "t" }, "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move Pane: Right" })
    map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

    -- Center when joining lines
    map("n", "J", "mzJ`z")

    -- Close Buffer & Close Buffer without saving
    map("n", "<leader>x", ":bd<CR>", { desc = "Close Current Buffer" })

    -- Show Lazy UI
    map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy " })

    -- Clear HLSearch
    map("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear Search Highlights" })

    -- Toggle folded line
    if vim.opt.foldenable:get() then
        vim.print("FOLD KEYMAPS")
        vim.keymap.set("n", "<leader>zz", function()
            local cur_line = vim.fn.line "."

            if vim.fn.foldclosed(cur_line) == -1 then
                vim.cmd [[foldclose]]
            else
                vim.cmd [[foldopen]]
            end
        end, { desc = "Toggle Fold" })
    end
end

return M
