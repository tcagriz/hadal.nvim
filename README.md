# hadal.nvim

Deep blue dark colorscheme for Neovim, based on the VS Code Abyss color theme.
It covers the UI, Treesitter, LSP, diagnostics, diff, terminal colors and plugin groups
(rainbow-delimiters, indent-blankline, nvim-tree, telescope, render-markdown,
todo-comments, snacks and bufferline).

## Install

lazy.nvim:

```lua
{
  "tcagriz/hadal.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("hadal")
  end,
}
```

Without a plugin manager, put the repo on your `runtimepath` and run
`:colorscheme hadal`.

## bufferline.nvim

With lazy.nvim, the Hadal highlights are merged into your own `akinsho/bufferline.nvim`
spec automatically (`lazy.lua` is marked `optional = true`, so it never installs the
plugin). Without lazy.nvim:

```lua
require("bufferline").setup({ highlights = require("hadal.bufferline") })
```

## Development

This plugin is developed inside the
[Hadal Theme Suite](https://github.com/tcagriz/hadal-theme) monorepo and mirrored here with
`git subtree split`. `lua/hadal/palette.lua` is generated from the suite's
`palette/palette.json`; do not edit it by hand. Send changes to the monorepo.

## License

MIT. The base colors come from the Abyss theme in
[microsoft/vscode](https://github.com/microsoft/vscode), see the LICENSE file.
