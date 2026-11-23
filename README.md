# hadal.nvim

Deep blue dark colorscheme for Neovim, based on the VS Code Abyss color theme.
It covers the UI, Treesitter, LSP, diagnostics, diff, terminal colors and popular
plugin groups.

## Discover

[View Hadal on Dotfyle](https://dotfyle.com/plugins/tcagriz/hadal.nvim) for
installation examples and Neovim plugin metadata.

## Requirements

- Neovim
- A true-color terminal is recommended

## Install with lazy.nvim

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

Restart Neovim or run `:Lazy sync`, then the colorscheme will load automatically.

## Other installation methods

Place this repository on Neovim's `runtimepath`, then run:

```vim
:colorscheme hadal
```

From the Hadal monorepo, you can alternatively run `./install.sh neovim`.

## bufferline.nvim

With lazy.nvim, Hadal highlights are merged into an existing
`akinsho/bufferline.nvim` spec automatically. The integration is optional and
does not install bufferline.nvim.

Without lazy.nvim:

```lua
require("bufferline").setup({
  highlights = require("hadal.bufferline"),
})
```

## Supported integrations

The colorscheme includes groups for rainbow-delimiters, indent-blankline,
nvim-tree, telescope, render-markdown, todo-comments, snacks and bufferline.

## Support and source

Ask installation and usage questions in
[Hadal Discussions](https://github.com/tcagriz/hadal-theme/discussions). Report
reproducible Neovim-specific bugs through the
[Hadal issue chooser](https://github.com/tcagriz/hadal-theme/issues/new/choose).
Source changes are made in the
[Hadal Theme Suite](https://github.com/tcagriz/hadal-theme) monorepo and mirrored
here. Suspected vulnerabilities must use the monorepo's
[private security report form](https://github.com/tcagriz/hadal-theme/security/advisories/new).

## License

MIT. The base colors come from the Abyss theme in
[microsoft/vscode](https://github.com/microsoft/vscode); see the
[license notice](LICENSE).
