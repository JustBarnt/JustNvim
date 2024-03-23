local diff_Node
local diff_Name
local utils = require "utils"

return {
    "justbarnt/neo-tree.nvim",
    -- branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols"
        },
        open_files_do_not_replace_types = { "terminal", "trouble", "qf", "edgy" },
        use_default_mappings = false,
        use_popups_for_input = false,
        default_component_configs = {
            indent = { indent_size = 2 },
            file_size = { enabled = false },
            type = { enabled = false },
            last_modified = { enabled = false },
            created = { enabled = false },
        },
        window = {
            mappings = {
                ["df"] = { "diff_files", desc = "Diff Two Files" },
                ["q"] = { "close_window", desc = "Close Neo-Tree" },
                ["R"] = { "refresh", desc = "Refresh Neo-Tree Window" },
                ["?"] = { "show_help", desc = "Show Help" },

                ["<2-LeftMouse>"] = { "open", desc = "Open" },
                ["<CR>"] = { "open", nowait = false, desc = "Open" },
                ["<esc>"] = { "cancel", desc = "Close Preview or floating Neo-tre window" },
                ["P"] = { "toggle_preview", desc = "Preview File", config = { use_float = false } },
                ["<C-S>"] = { "open_vsplit", desc = "Open File in Split" },
                ["<C-c>"] = { "close_all_nodes", desc = "Close all Folder Nodes " },

                ["a"] = { "add", desc = "Add File/Directory", nowait = true, config = { show_path = "relative" } },
                ["d"] = { "delete", desc = "Delete File/Directory" },
                ["r"] = { "rename", desc = "Rename File/Directory" },
                ["y"] = { "copy_to_clipboard", desc = "Copy To Clipboard" },
                ["x"] = { "cut_to_clipboard", desc = "Cut To Clipboard" },
                ["p"] = { "paste_from_clipboard", desc = "Paste From Clipboard" },
                ["c"] = { "copy", desc = "Copy File/Directory to...", config = { show_path = "relative" } },
                ["m"] = { "move", desc = "Move File/Directory to...", config = { show_path = "relative" } },
            },
        },
        commands = {
            diff_files = function(state)
                local node = state.tree:get_node()
                local log = require "neo-tree.log"
                state.clipboard = state.clipboard or {}
                if diff_Node and diff_Node ~= tostring(node.id) then
                    local current_Diff = node.id
                    require("neo-tree.utils").open_file(state, diff_Node, open)
                    vim.cmd("vert diffs " .. current_Diff)
                    log.info("Diffing " .. diff_Name .. " against " .. node.name)
                    diff_Node = nil
                    current_Diff = nil
                    state.clipboard = {}
                    require("neo-tree.ui.renderer").redraw(state)
                else
                    local existing = state.clipboard[node.id]
                    if existing and existing.action == "diff" then
                        state.clipboard[node.id] = nil
                        diff_Node = nil
                        require("neo-tree.ui.renderer").redraw(state)
                    else
                        state.clipboard[node.id] = { action = "diff", node = node }
                        diff_Name = state.clipboard[node.id].node.name
                        diff_Node = tostring(state.clipboard[node.id].node.id)
                        log.info("Diff source file " .. diff_Name)
                        require("neo-tree.ui.renderer").redraw(state)
                    end
                end
            end,
        },
        filesystem = {
            filtered_items = {
                hide_by_name = { ".svn/", ".bin/", ".obj/", ".svelte-kit/" },
            },
            use_libuv_file_watcher = true,
            window = {
                mappings = {
                    ["-"] = { "navigate_up", desc = "Directory Up" },
                    ["_"] = { "set_root", desc = "Set Current Directory" },
                    ["."] = { "toggle_hidden", desc = "Show Hidden Files" },
                    ["o"] = {
                        "show_help",
                        desc = "Show Help",
                        nowait = false,
                        config = { title = "Order by", prefix_key = "o" },
                    },
                    ["oc"] = { "order_by_created", desc = "Order By Created", nowait = false },
                    ["om"] = { "order_by_modified", desc = "Order By Modified", nowait = false },
                    ["on"] = { "order_by_name", desc = "Order By Name", nowait = false },
                    ["os"] = { "order_by_size", desc = "Order By Size", nowait = false },
                    ["ot"] = { "order_by_type", desc = "Order By Type", nowait = false },
                },
                fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                    ["<down>"] = "move_cursor_down",
                    ["<C-j>"] = "move_cursor_down",
                    ["<up>"] = "move_cursor_up",
                    ["<C-k>"] = "move_cursor_up",
                },
            },
        },
    },
    config = function(_, opts)
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup(utils.create_spec("neo-tree", opts))
        utils.map("n", "\\", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neotree" })
    end,
}
