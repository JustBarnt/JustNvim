# Tests
- [ ] Treesitter configs
- [ ] Telescope configs

# TODO AFTER 2.0
- [ ] Make Neodev and Neoconf opt-in

# TODO
- [ ] Load `Core` as its own set of plugins before the other plugins
- [x] Better CMP configuration
- [ ] Add a [health](https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/health.lua) command 
- [ ] nvim-spectre
- [ ] DAP setup
    - [ ] C/C#
    - [ ] JS/TS
- [ ] Install cheat.nvim (cheat.sh) plugin
- [ ] Automatically open Oil when last buffer closes instead of an Empty buffer
- [ ] Setup help-doc
- [ ] Setup Commands (As splits)
      Open Timesheets (Neorg)
      Open Daily Tasks (Neorg)

## Keymaps
For setting up overrwritable keymaps
    - Create a base table for the Distros
      starting keymaps
    - Then an empty table for users then `tbl_deep_extend`
      merge them, that way uses can safely overwrite default maps
      I set.

## Custom Code actions menu
https://github.com/nvim-telescope/telescope.nvim/pull/878

## Clean-up
- [ ] use cond enabled and is !vim.g.vscode for plugins
    - Figure out what plugins are vscode safe, like nvim-surround should be safe, but GUI plugins arent
- [ ] Write Svelte Treesitter queries to improve special block highlighting and indenting
