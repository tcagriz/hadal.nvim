vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "hadal"
vim.o.termguicolors = true
vim.o.background = "dark"

local c = require("hadal.palette")

local ansi = c.ansi
for i, color in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

local hl = vim.api.nvim_set_hl
local function set(g, o) hl(0, g, o) end

set("Normal",       { fg = c.fg, bg = c.bg })
set("NormalFloat",  { fg = c.fg, bg = c.float })
set("CursorLine",   { bg = c.hover })
set("CursorLineNr", { fg = c.cursor })
set("LineNr",       { fg = c.linenr })
set("Visual",       { bg = c.sel })
set("Pmenu",        { fg = c.fg, bg = c.input })
set("PmenuSel",     { bg = c.active })
set("StatusLine",   { fg = c.fg, bg = c.line })
set("VertSplit",    { fg = c.border })
set("Comment",      { fg = c.comment, italic = true })
set("String",       { fg = c.string })
set("Keyword",      { fg = c.keyword })
set("Function",     { fg = c.func })
set("Constant",     { fg = c.const })
set("Type",         { fg = c.type })
set("Error",        { fg = c.err })

-- UI
set("NormalNC",     { fg = c.fg, bg = c.bg })
set("SignColumn",   { bg = c.bg })
set("EndOfBuffer",  { fg = c.bg })
set("CursorColumn", { bg = c.hover })
set("ColorColumn",  { bg = c.line })
set("WinSeparator", { fg = c.border })
set("StatusLineNC", { fg = c.linenr, bg = c.line })
set("TabLine",      { fg = c.linenr, bg = c.line })
set("TabLineSel",   { fg = c.fg, bg = c.bg })
set("TabLineFill",  { bg = c.line })
set("FloatBorder",  { fg = c.border, bg = c.float })
set("Search",       { fg = c.bg, bg = c.cursor })
set("IncSearch",    { fg = c.bg, bg = c.number })
set("MatchParen",   { fg = c.cursor, bold = true, underline = true })
set("Folded",       { fg = c.comment, bg = c.line })
set("NonText",      { fg = c.border })
set("Whitespace",   { fg = c.border })
set("Directory",    { fg = c.param })
set("Title",        { fg = c.func, bold = true })
set("Visual",       { bg = c.sel })
set("WildMenu",     { bg = c.active })
set("ErrorMsg",     { fg = c.err })
set("WarningMsg",   { fg = c.warn })

-- Vim syntax
set("Identifier",   { fg = c.fg })
set("Statement",    { fg = c.keyword })
set("Operator",     { fg = c.fg })
set("Number",       { fg = c.number })
set("Boolean",      { fg = c.number })
set("Float",        { fg = c.number })
set("Character",    { fg = c.number })
set("PreProc",      { fg = c.keyword })
set("Special",      { fg = c.func })
set("StorageClass", { fg = c.builtin, italic = true })
set("Delimiter",    { fg = c.fg })
set("Todo",         { fg = c.bg, bg = c.func, bold = true })

-- Treesitter
local ts = {
  ["@variable"]                = { fg = c.fg },
  ["@variable.builtin"]        = { fg = c.builtin },
  ["@variable.parameter"]      = { fg = c.param, italic = true },
  ["@variable.member"]         = { fg = c.fg },
  ["@property"]                = { fg = c.fg },
  ["@constant"]                = { fg = c.number },
  ["@constant.builtin"]        = { fg = c.number },
  ["@number"]                  = { fg = c.number },
  ["@boolean"]                 = { fg = c.number },
  ["@string"]                  = { fg = c.string },
  ["@string.escape"]           = { fg = c.number },
  ["@string.regexp"]           = { fg = c.string },
  ["@character"]               = { fg = c.number },
  ["@comment"]                 = { link = "Comment" },
  ["@keyword"]                 = { fg = c.keyword },
  ["@keyword.function"]        = { fg = c.builtin, italic = true },
  ["@keyword.type"]            = { fg = c.builtin, italic = true },
  ["@keyword.modifier"]        = { fg = c.builtin, italic = true },
  ["@keyword.operator"]        = { fg = c.keyword },
  ["@type"]                    = { fg = c.type },
  ["@type.builtin"]            = { fg = c.builtin, italic = true },
  ["@module"]                  = { fg = c.type },
  ["@function"]                = { fg = c.func },
  ["@function.call"]           = { fg = c.func },
  ["@function.builtin"]        = { fg = c.builtin },
  ["@function.method"]         = { fg = c.func },
  ["@function.method.call"]    = { fg = c.func },
  ["@constructor"]             = { fg = c.type },
  ["@operator"]                = { fg = c.fg },
  ["@punctuation"]             = { fg = c.fg },
  ["@punctuation.bracket"]     = { fg = c.fg },
  ["@punctuation.delimiter"]   = { fg = c.fg },
  ["@tag"]                     = { fg = c.keyword },
  ["@tag.attribute"]           = { fg = c.func },
  ["@tag.delimiter"]           = { fg = c.fg },
  ["@attribute"]               = { fg = c.func },
  ["@markup.heading"]          = { fg = c.func, bold = true },
  ["@markup.strong"]           = { fg = c.string, bold = true },
  ["@markup.italic"]           = { fg = c.string, italic = true },
  ["@markup.strikethrough"]    = { strikethrough = true },
  ["@markup.raw"]              = { fg = c.builtin },
  ["@markup.quote"]            = { fg = c.string },
  ["@markup.link"]             = { fg = c.param, underline = true },
  ["@markup.link.url"]         = { fg = c.param, underline = true },
  ["@diff.plus"]               = { fg = c.add },
  ["@diff.minus"]              = { fg = c.err },
  ["@diff.delta"]              = { fg = c.change },
}
for group, opts in pairs(ts) do set(group, opts) end

-- LSP
set("DiagnosticError",          { fg = c.err })
set("DiagnosticWarn",           { fg = c.warn })
set("DiagnosticInfo",           { fg = c.info })
set("DiagnosticHint",           { fg = c.hint })
set("DiagnosticOk",             { fg = c.string })
set("DiagnosticUnderlineError", { undercurl = true, sp = c.err })
set("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warn })
set("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.info })
set("DiagnosticUnderlineHint",  { undercurl = true, sp = c.hint })
set("DiagnosticVirtualTextError", { fg = c.err,  bg = c.error_bg })
set("DiagnosticVirtualTextWarn",  { fg = c.warn, bg = c.warn_bg })
set("DiagnosticVirtualTextInfo",  { fg = c.info, bg = c.info_bg })
set("DiagnosticVirtualTextHint",  { fg = c.hint, bg = c.hint_bg })
set("LspReferenceText",         { bg = c.active })
set("LspReferenceRead",         { bg = c.active })
set("LspReferenceWrite",        { bg = c.active })
set("LspInlayHint",             { fg = c.comment, bg = c.line })
set("LspCodeLens",              { fg = c.comment })
set("LspSignatureActiveParameter", { fg = c.param, bold = true })
set("@lsp.type.parameter",      { link = "@variable.parameter" })
set("@lsp.type.property",       { link = "@property" })
set("@lsp.type.namespace",      { link = "@module" })
set("@lsp.type.class",          { link = "@type" })
set("@lsp.type.interface",      { link = "@type" })
set("@lsp.type.enum",           { link = "@type" })
set("@lsp.type.function",       { link = "@function" })
set("@lsp.type.method",         { link = "@function.method" })

-- Diff / git
set("DiffAdd",    { bg = c.diff_add })
set("DiffChange", { bg = c.diff_change })
set("DiffDelete", { fg = c.err, bg = c.diff_delete })
set("DiffText",   { bg = c.diff_text })
set("Added",      { fg = c.add })
set("Changed",    { fg = c.change })
set("Removed",    { fg = c.err })

-- rainbow-delimiters
set("RainbowDelimiterRed",    { fg = ansi[2] })
set("RainbowDelimiterYellow", { fg = ansi[4] })
set("RainbowDelimiterBlue",   { fg = ansi[13] })
set("RainbowDelimiterOrange", { fg = c.change })
set("RainbowDelimiterGreen",  { fg = ansi[3] })
set("RainbowDelimiterViolet", { fg = ansi[14] })
set("RainbowDelimiterCyan",   { fg = ansi[7] })

-- indent-blankline
set("IblIndent", { fg = c.border })
set("IblScope",  { fg = c.linenr })

-- nvim-tree
set("NvimTreeNormal",           { fg = c.fg, bg = c.side })
set("NvimTreeNormalNC",         { fg = c.fg, bg = c.side })
set("NvimTreeEndOfBuffer",      { fg = c.side, bg = c.side })
set("NvimTreeWinSeparator",     { fg = c.border, bg = c.side })
set("NvimTreeCursorLine",       { bg = c.hover })
set("NvimTreeRootFolder",       { fg = c.func, bold = true })
set("NvimTreeFolderName",       { fg = c.param })
set("NvimTreeOpenedFolderName", { fg = c.param, bold = true })
set("NvimTreeEmptyFolderName",  { fg = c.comment })
set("NvimTreeOpenedHL",         { fg = c.func })
set("NvimTreeSpecialFile",      { fg = c.builtin, underline = true })
set("NvimTreeIndentMarker",     { fg = c.border })
set("NvimTreeGitDirtyIcon",     { fg = c.change })
set("NvimTreeGitStagedIcon",    { fg = c.add })
set("NvimTreeGitNewIcon",       { fg = c.string })
set("NvimTreeGitDeletedIcon",   { fg = c.err })
set("NvimTreeGitIgnoredIcon",   { fg = c.comment })

-- telescope
local badge = { fg = c.bg, bg = c.string, bold = true }

set("TelescopeNormal",         { fg = c.fg, bg = c.side })
set("TelescopeBorder",         { fg = c.border, bg = c.side })
set("TelescopePromptNormal",   { fg = c.fg, bg = c.side })
set("TelescopePromptBorder",   { fg = c.param, bg = c.side })
set("TelescopeResultsNormal",  { fg = c.fg, bg = c.side })
set("TelescopeResultsBorder",  { fg = c.border, bg = c.side })
set("TelescopePreviewNormal",  { fg = c.fg, bg = c.bg })
set("TelescopePreviewBorder",  { fg = c.border, bg = c.bg })
set("TelescopeTitle",          badge)
set("TelescopePromptTitle",    badge)
set("TelescopeResultsTitle",   badge)
set("TelescopePreviewTitle",   badge)
set("TelescopePromptPrefix",   { fg = c.func, bg = c.side })
set("TelescopeSelection",      { fg = c.fg, bg = c.active })
set("TelescopeSelectionCaret", { fg = c.func, bg = c.active })
set("TelescopeMatching",       { fg = c.func, bold = true })
set("TelescopeMultiSelection", { fg = c.number })

-- bufferline colors live in lua/hadal/bufferline.lua (bufferline recomputes its highlights itself)

-- render-markdown
local h = { c.func, c.param, c.string, c.builtin, c.number, c.keyword }
for i, color in ipairs(h) do
  set("RenderMarkdownH" .. i,     { fg = color, bold = true })
  set("RenderMarkdownH" .. i .. "Bg", { fg = color, bg = c.line, bold = true })
end
set("RenderMarkdownCode",       { bg = c.line })
set("RenderMarkdownCodeInline", { fg = c.builtin, bg = c.line })
set("RenderMarkdownBullet",     { fg = c.func })
set("RenderMarkdownQuote",      { fg = c.string })
set("RenderMarkdownLink",       { fg = c.param })
set("RenderMarkdownTableHead",  { fg = c.func, bold = true })
set("RenderMarkdownTableRow",   { fg = c.border })
set("RenderMarkdownDash",       { fg = c.border })

-- todo-comments
local todo = {
  Fix = c.err, Todo = c.info, Hint = c.hint, Warn = c.warn, Perf = c.builtin, Test = c.number,
}
for name, color in pairs(todo) do
  set("TodoBg" .. name:upper(), { fg = c.bg, bg = color, bold = true })
  set("TodoFg" .. name:upper(), { fg = color })
  set("TodoSign" .. name:upper(), { fg = color })
end

-- snacks
set("SnacksNormal",         { fg = c.fg, bg = c.float })
set("SnacksWinBar",         { fg = c.fg, bg = c.line })
set("SnacksInputNormal",    { fg = c.fg, bg = c.float })
set("SnacksInputBorder",    { fg = c.param, bg = c.float })
set("SnacksInputTitle",     { fg = c.func, bg = c.float, bold = true })
set("SnacksNotifierInfo",   { fg = c.fg, bg = c.float })
set("SnacksNotifierWarn",   { fg = c.fg, bg = c.float })
set("SnacksNotifierError",  { fg = c.fg, bg = c.float })
set("SnacksNotifierBorderInfo",  { fg = c.info,  bg = c.float })
set("SnacksNotifierBorderWarn",  { fg = c.warn,  bg = c.float })
set("SnacksNotifierBorderError", { fg = c.err,   bg = c.float })
set("SnacksNotifierTitleInfo",   { fg = c.info,  bold = true })
set("SnacksNotifierTitleWarn",   { fg = c.warn,  bold = true })
set("SnacksNotifierTitleError",  { fg = c.err,   bold = true })

