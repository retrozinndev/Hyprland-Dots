# retrozinndev's `.config/nvim`
My minimal neovim configuration with the plugins I use!

For managing plugins, I use the new native plugin manager (`vim.pack`).
Also, I'm using native `treesitter` and `lsp`.
To make this config work in your environment, please use latest Neovim nightly. (You can use [`bob`](https://github.com/mordechaihadad/bob) for that)

## Commands
This config provides, for now, a command to update all plugins from the native manager.
Run `:PackUpdate` to update all the plugins. It is an alias for the lua api: `vim.pack.update()`.

After updating, neovim will open a new tab showing the commits that have been fetched. You can
confirm the update by saving the buffer tab(`:w`) or cancel by quitting the tab(`:q`).

## Plugins

- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim) : really good file explorer for neovim.
- [`vyfor/cord.nvim`](https://github.com/vyfor/cord.nvim) : amazing discord rich presence support for neovim.
- [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) : icons for neovim
- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): native lsp completion for neovim
- [`folke/trouble.nvim`](https://github.com/folke/trouble.nvim): lsp diagnostic info.
- [`shaun-mathew/Chameleon.nvim`](https://github.com/shaun-mathew/Chameleon.nvim): change kitty terminal's background according to neovim's one(fixes that border arround neovim when using padding).
- [`echasnovski/mini.pick`](https://github.com/echasnovski/mini.pick): mini picker for neovim, works just like telescope.
- [`ThePrimeagen/refactoring.nvim`](https://github.com/ThePrimeagen/refactoring.nvim): a nice refactoring plugin for neovim, supports only a specific set of languages.
- [`rachartier/tiny-inline-diagnostic.nvim`](https://github.com/rachartier/tiny-inline-diagnostic.nvim): inline lsp diagnostics
- [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim): plugin for viewing diffs and change feed in-file.
- [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify): notification banners for neovim.
- [`nvim-lualine/lualine`](https://github.com/nvim-lualine/lualine.nvim): better buffer line.


## Color schemes (themes)

- [`catppuccin`](https://github.com/catppuccin/nvim): the awesome catppuccin colorscheme (i use mocha sometimes).
- [`nyoom-engineering/oxocarbon.nvim`](https://github.com/nyoom-engineering/oxocarbon.nvim): pretty different, but it looks awesome.
- [`xiantang/darcula-dark.nvim`](https://github.com/xiantang/darcula-dark.nvim): jetbrains' darcula dark for neovim.
- [`rebelot/kanagawa.nvim`](https://github.com/rebelot/kanagawa.nvim): the nice kanagawa color scheme.
- [`scottmckendry/cyberdream.nvim`](https://github.com/scottmckendry/cyberdream.nvim): a high-contrast and futuristic color scheme.
- [`folke/tokyonight.nvim`](https://github.com/folke/tokyonight.nvim): very famous colorscheme **(enabled)**

### Changing Themes (color schemes)
You can change the colorscheme temporarily by running `:colorscheme {preference}`, or, for session persistent colorscheme, edit the `init.lua` file, in the `vim.cmd.colorscheme` line, set the string to your preferred scheme.
