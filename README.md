# A Neovim Plugin Template

![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)
# NvaderVIM
This is my creation of an opinated Neovim Distribution.

### Why?
Other Distros included multiple plugins I didn't use and I wanted to use this as a good experience to learn more about neovim
itself.

## Pre-requisites
1. Neovim >= 0.9.5
2. a `C` compliler for `nvim-treesitter`
    a. `make` optional, but there are plugins that use `make` such as `telescope-fzf` for fuzzy finding
3. [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for Telescope grep searching which this Distribution uses as a core feature
4. [fd](https://github.com/sharkdp/fd) is a cross-platform `find` like program that `Telescope` uses for its 'find_files' functionality to deliver insanely fast file searching
5. Git >= 2.19.0
6. Any terminal that supports true color and undercurl.
    - Ex: kitty (Linux/Mac), wezterm (Linux/Mac/Windows)
    - WindowsTerminal now supports undercurl as of `1.19`

### Optionals
1. [Nerd Fonts](https://nerdfonts.com) - All icons used are nerd font specific so without them icons will look similar to what you see in github when looking at icons defined in the repo
2. [lazygit](https://github.com/jesseduffield/lazygit) - a TUI git application I integrate this inside of [toggleterm](https://github.com/akinsho/toggleterm.nvim) to provide a seemless what to use git without having to leave neovim
3. [Node](https://nodejs.org) - Required to download several LSP's
4. `sqlite3` - `telescope-frecency` and `legendary` both use this to recommend files, keys, commands you frequently use without this installed those features are disabled

## Installing
>TODO

### Configuration
1. You need to move|copy `lua/default_config.lua` -> `lua/user/config.lua`
2. After that your config will overwrite anything of the items you see defined in the configuration
