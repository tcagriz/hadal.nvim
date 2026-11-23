# Hadal for Neovim instructions

## Mirror policy

- This repository is a synchronized mirror of the `neovim/` directory in
  [tcagriz/hadal-theme](https://github.com/tcagriz/hadal-theme).
- Make primary source changes in `hadal-theme/neovim/`, sync them with
  `scripts/sync.sh nvim`, and submit mirror changes through a pull request.
- Never push directly to `main`.
- Bug reports and feature requests belong in the `hadal-theme` monorepo.
  Suspected vulnerabilities must use its private vulnerability report.
- `lua/hadal/palette.lua` is generated from `palette/palette.json` by the
  monorepo generator. Do not hand-edit it.
- `colors/hadal.lua`, `lua/hadal/bufferline.lua` and `lazy.lua` are
  hand-written integration files.

## Development rules

- Preserve `vim.g.colors_name = "hadal"` and compatibility with the
  documented lazy.nvim installation.
- Keep core UI, Treesitter, LSP, diagnostics, diff and terminal highlight
  groups complete.
- Reuse entries from `hadal.palette`; do not introduce one-off hex colors in
  the hand-written highlight definitions.
- Keep the bufferline integration optional. Evaluating `lazy.lua` must not
  require bufferline.nvim to be installed.
- Preserve a direct `runtimepath` installation path in addition to lazy.nvim.
- Keep the supported-plugin list in the README aligned with the actual
  highlight groups.

## Validation

When Neovim is available, run from the package root:

```sh
nvim --headless -u NONE \
  -c 'set runtimepath+=.' \
  -c 'colorscheme hadal' \
  -c 'lua assert(vim.g.colors_name == "hadal")' \
  -c 'lua assert(vim.api.nvim_get_hl(0, { name = "Normal" }).bg ~= nil)' \
  -c 'qa'
nvim --headless -u NONE \
  -c 'lua vim.opt.rtp:append(vim.fn.getcwd()); assert(type(dofile("lazy.lua")) == "table")' \
  -c 'qa'
```

Run a palette generator check in the source monorepo before syncing. A clean
checkout must load without Lua errors, and no generated palette file may be
edited by hand.
