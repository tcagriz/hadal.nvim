-- Hadal highlights for bufferline.nvim.
-- Without lazy.nvim: require("bufferline").setup({ highlights = require("hadal.bufferline") })
local c = require("hadal.palette")
local idle, sel, fill = c.line, c.bg, c.side

local function state(fg)
  local function h(bg, extra) return vim.tbl_extend("force", { fg = fg, bg = bg }, extra or {}) end
  return h(idle), h(idle), h(sel, { bold = true })
end

local highlights = {
  fill = { bg = fill },
  background = { fg = c.linenr, bg = idle },
  buffer_visible = { fg = c.fg, bg = idle },
  buffer_selected = { fg = c.fg, bg = sel, bold = true, italic = false },
  separator = { fg = fill, bg = idle },
  separator_visible = { fg = fill, bg = idle },
  separator_selected = { fg = fill, bg = sel },
  indicator_visible = { fg = c.linenr, bg = idle },
  indicator_selected = { fg = c.param, bg = sel },
  close_button = { fg = c.linenr, bg = idle },
  close_button_visible = { fg = c.linenr, bg = idle },
  close_button_selected = { fg = c.err, bg = sel },
  modified = { fg = c.change, bg = idle },
  modified_visible = { fg = c.change, bg = idle },
  modified_selected = { fg = c.change, bg = sel },
  duplicate = { fg = c.comment, bg = idle, italic = true },
  duplicate_visible = { fg = c.comment, bg = idle, italic = true },
  duplicate_selected = { fg = c.comment, bg = sel, italic = true },
  numbers = { fg = c.linenr, bg = idle },
  numbers_visible = { fg = c.linenr, bg = idle },
  numbers_selected = { fg = c.func, bg = sel },
  tab = { fg = c.linenr, bg = idle },
  tab_selected = { fg = c.fg, bg = sel },
  tab_close = { fg = c.err, bg = fill },
  offset_separator = { fg = c.border, bg = fill },
}

for name, fg in pairs({ error = c.err, warning = c.warn, info = c.info, hint = c.hint }) do
  local a, b, s = state(fg)
  highlights[name] = a
  highlights[name .. "_visible"] = b
  highlights[name .. "_selected"] = s
  highlights[name .. "_diagnostic"] = a
  highlights[name .. "_diagnostic_visible"] = b
  highlights[name .. "_diagnostic_selected"] = s
end

return highlights
