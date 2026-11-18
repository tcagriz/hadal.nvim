-- lazy.nvim spec: applies the Hadal highlights to bufferline.nvim.
-- `optional = true` means this only takes effect if you already use bufferline.nvim;
-- it merges with your own spec instead of installing the plugin.
return {
  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, require("hadal.bufferline"))
    end,
  },
}
