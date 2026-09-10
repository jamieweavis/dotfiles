-- vscode-dark-2026
--
-- Editor colours come from Microsoft's "2026 Dark" default theme
-- https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/2026-dark.json
--
-- Only groups that differ from Neovim's own defaults are listed. Anything a
-- default link already resolves correctly is left out, so `Keyword` follows
-- `Statement`, `Number` follows `Constant`, and most `@` captures need no
-- entry at all. See `:h group-name` and `:h treesitter-highlight-groups`.

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end

vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.colors_name = 'vscode-dark-2026'

local p = {
  -- Surfaces
  bg = '#121314', -- editor
  bg_dim = '#191a1b', -- statusline, tabline, folds
  bg_pane = '#202122', -- floats, popup menus
  bg_line = '#242526', -- cursor line and column
  bg_sel = '#276782', -- visual selection
  border = '#2a2b2c',

  -- Foregrounds, brightest first
  fg_hi = '#ededed', -- text on an accent background
  fg_soft = '#bfbfbf', -- text inside panes and the statusline
  fg = '#bbbebf', -- editor text
  fg_dim = '#8c8c8c', -- folds, listchars, menu detail
  fg_faint = '#858889', -- line numbers
  fg_thin = '#838485', -- indent guides, scrollbar thumb
  fg_off = '#555555', -- ignored text

  -- Accent (pickers, matches, selected rows)
  accent = '#3994bc',
  accent_hi = '#48a0c7',
  accent_lo = '#297aa0',

  -- Tokens
  comment = '#8b949e',
  red = '#ff7b72',
  green = '#7ee787',
  orange = '#ffa657',
  blue = '#79c0ff',
  purple = '#d2a8ff',
  sky = '#a5d6ff', -- strings
  silver = '#c9d1d9', -- variables, parameters
  salmon = '#ffa198', -- invalid syntax

  -- Signals, shared by diagnostics and git
  error = '#f48771',
  warn = '#e5ba7d',
  ok = '#73c991',
}

-- Neovim highlights must be opaque, but the source theme layers translucent
-- washes over the editor. Flatten one onto the background. `a` is the source
-- alpha byte, kept as written upstream: #3994bc26 becomes (accent, 0x26).
local function alpha(hex, a)
  local function channel(i)
    local top = tonumber(hex:sub(i, i + 1), 16)
    local under = tonumber(p.bg:sub(i, i + 1), 16)
    return math.floor((top * a + under * (0xff - a)) / 0xff + 0.5)
  end
  return string.format('#%02x%02x%02x', channel(2), channel(4), channel(6))
end

local row = alpha(p.accent, 0x26) -- wash behind a selected row

local groups = {
  -- Editor
  Normal = { fg = p.fg, bg = p.bg },
  NormalNC = { link = 'Normal' },
  NormalFloat = { fg = p.fg_soft, bg = p.bg_pane },
  FloatBorder = { fg = p.border, bg = p.bg_pane },
  FloatTitle = { fg = p.fg_soft, bg = p.bg_pane, bold = true },
  Cursor = { fg = p.bg, bg = p.fg },
  CursorLine = { bg = p.bg_line },
  CursorColumn = { link = 'CursorLine' },
  ColorColumn = { link = 'CursorLine' },
  LineNr = { fg = p.fg_faint, bg = p.bg },
  CursorLineNr = { fg = p.fg, bg = p.bg, bold = true },
  SignColumn = { bg = p.bg },
  FoldColumn = { fg = p.fg_dim, bg = p.bg },
  Folded = { fg = p.fg_dim, bg = p.bg_dim },
  WinSeparator = { fg = p.border, bg = p.bg },
  EndOfBuffer = { fg = p.bg },
  NonText = { fg = p.fg_dim },
  SpecialKey = { link = 'NonText' },
  Conceal = { link = 'NonText' },
  Whitespace = { fg = alpha(p.fg_dim, 0x4d) },

  -- Selection and search
  Visual = { bg = p.bg_sel },
  Search = { bg = alpha(p.bg_sel, 0x80) },
  IncSearch = { fg = p.fg_hi, bg = p.bg_sel },
  CurSearch = { link = 'IncSearch' },
  MatchParen = { bg = alpha(p.accent, 0x55), bold = true },

  -- Statusline and tabs
  StatusLine = { fg = p.fg_soft, bg = p.bg_dim },
  StatusLineNC = { fg = p.fg_dim, bg = p.bg_dim },
  TabLineSel = { fg = p.fg_soft, bg = p.bg },
  TabLineFill = { bg = p.bg_dim },
  WinBar = { fg = p.fg_dim, bg = p.bg },
  WinBarNC = { link = 'WinBar' },

  -- Popup menu
  Pmenu = { fg = p.fg_soft, bg = p.bg_pane },
  PmenuSel = { fg = p.fg_hi, bg = row },
  PmenuKind = { fg = p.blue, bg = p.bg_pane },
  PmenuKindSel = { fg = p.blue, bg = row },
  PmenuExtra = { fg = p.fg_dim, bg = p.bg_pane },
  PmenuExtraSel = { fg = p.fg_dim, bg = row },
  PmenuSbar = { bg = p.bg_pane },
  PmenuThumb = { bg = alpha(p.fg_thin, 0x33) },
  WildMenu = { fg = p.fg_soft, bg = row },

  -- Messages
  ErrorMsg = { fg = p.error },
  WarningMsg = { fg = p.warn },
  ModeMsg = { fg = p.fg_soft },
  MoreMsg = { fg = p.blue },
  Question = { link = 'MoreMsg' },
  Directory = { link = 'MoreMsg' },
  Title = { fg = p.blue, bold = true },

  -- Syntax
  Comment = { fg = p.comment, italic = true },
  SpecialComment = { link = 'Comment' },
  Constant = { fg = p.blue },
  String = { fg = p.sky },
  Character = { fg = p.red },
  Identifier = { fg = p.orange },
  Function = { fg = p.purple },
  Debug = { link = 'Function' },
  Statement = { fg = p.red },
  PreProc = { fg = p.red },
  Type = { fg = p.red },
  Operator = { fg = p.fg_soft },
  Delimiter = { link = 'Operator' },
  Special = { fg = p.blue },
  SpecialChar = { fg = p.green, bold = true },
  Tag = { fg = p.green },
  Underlined = { fg = p.blue, underline = true },
  Todo = { fg = p.orange, bold = true },
  Error = { fg = p.salmon, italic = true },
  Ignore = { fg = p.fg_off },

  -- Spell
  SpellBad = { sp = p.error, undercurl = true },
  SpellCap = { sp = p.warn, undercurl = true },
  SpellLocal = { sp = p.accent, undercurl = true },
  SpellRare = { sp = p.purple, undercurl = true },

  -- Diff. `Added`/`Removed`/`Changed` also cover diff files and `@diff.*`.
  Added = { fg = p.ok },
  Removed = { fg = p.error },
  Changed = { fg = p.warn },
  DiffAdd = { bg = alpha('#347d39', 0x26) },
  DiffDelete = { fg = p.error, bg = alpha('#c93c37', 0x26) },
  DiffChange = { bg = alpha(p.accent, 0x1a) },
  DiffText = { bg = alpha('#57ab5a', 0x4d) },
  diffFile = { fg = p.blue },
  diffLine = { fg = p.purple, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = p.error },
  DiagnosticWarn = { fg = p.warn },
  DiagnosticInfo = { fg = p.accent },
  DiagnosticHint = { fg = p.blue },
  DiagnosticOk = { fg = p.ok },
  DiagnosticUnderlineError = { sp = p.error, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.warn, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.accent, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.blue, undercurl = true },
  DiagnosticVirtualTextError = { fg = p.error, bg = '#3a1d1d' },
  DiagnosticVirtualTextWarn = { fg = p.warn, bg = '#352a05' },
  DiagnosticVirtualTextInfo = { fg = p.accent, bg = '#1e3a47' },
  DiagnosticVirtualTextHint = { fg = p.blue, bg = p.bg_line },

  -- Treesitter, where the token colour differs from the default link
  ['@attribute'] = { fg = p.purple },
  ['@constant.macro'] = { fg = p.red },
  ['@constructor'] = { fg = p.orange },
  ['@function.builtin'] = { link = 'Function' },
  ['@function.macro'] = { fg = p.red },
  ['@module'] = { fg = p.orange },
  ['@property'] = { fg = p.blue },
  ['@punctuation.special'] = { fg = p.red },
  ['@string.regexp'] = { link = 'String' },
  ['@string.special'] = { fg = p.blue },
  ['@string.escape'] = { link = 'SpecialChar' },
  ['@string.special.url'] = { fg = p.sky, underline = true },
  ['@tag.attribute'] = { fg = p.silver },
  ['@tag.delimiter'] = { link = 'Operator' },
  ['@type.builtin'] = { link = 'Type' },
  ['@variable'] = { fg = p.orange },
  ['@variable.member'] = { fg = p.blue },
  ['@variable.parameter'] = { fg = p.silver },

  -- Markup
  ['@markup.italic'] = { fg = p.silver, italic = true },
  ['@markup.strong'] = { fg = p.silver, bold = true },
  ['@markup.underline'] = { underline = true },
  ['@markup.strikethrough'] = { strikethrough = true },
  ['@markup.quote'] = { fg = p.green },
  ['@markup.list'] = { fg = p.orange },
  ['@markup.link'] = { fg = p.sky },
  ['@markup.link.url'] = { link = '@string.special.url' },

  -- Semantic tokens. The rest follow their treesitter equivalents.
  ['@lsp.type.class'] = { fg = p.orange },
  ['@lsp.type.variable'] = { fg = p.silver }, -- plain, unlike @variable
  ['@lsp.mod.readonly'] = { fg = p.blue },
  ['@lsp.mod.defaultLibrary'] = { fg = p.blue },

  -- LSP references and signature help
  LspReferenceText = { bg = alpha(p.bg_sel, 0x50) },
  LspReferenceRead = { link = 'LspReferenceText' },
  LspReferenceWrite = { bg = alpha(p.bg_sel, 0x80) },
  LspSignatureActiveParameter = { fg = p.orange, bold = true },

  -- gitsigns
  GitSignsAdd = { link = 'Added' },
  GitSignsChange = { link = 'Changed' },
  GitSignsDelete = { link = 'Removed' },

  -- telescope
  TelescopeNormal = { link = 'NormalFloat' },
  TelescopeBorder = { link = 'FloatBorder' },
  TelescopePromptNormal = { link = 'NormalFloat' },
  TelescopePromptBorder = { link = 'FloatBorder' },
  TelescopeResultsTitle = { link = 'FloatBorder' },
  TelescopePromptTitle = { fg = p.fg_hi, bg = p.accent_lo, bold = true },
  TelescopePreviewTitle = { link = 'TelescopePromptTitle' },
  TelescopeSelection = { link = 'PmenuSel' },
  TelescopeMatching = { fg = p.accent_hi, bold = true },

  -- indent-blankline
  IblIndent = { fg = alpha(p.fg_thin, 0x4d) },
  IblScope = { fg = p.fg_thin },

  -- nvim-cmp
  CmpItemAbbr = { fg = p.fg_soft },
  CmpItemAbbrDeprecated = { fg = p.fg_dim, strikethrough = true },
  CmpItemAbbrMatch = { link = 'TelescopeMatching' },
  CmpItemAbbrMatchFuzzy = { link = 'TelescopeMatching' },
  CmpItemMenu = { fg = p.fg_dim },
  CmpItemKind = { fg = p.purple },
  CmpItemKindFunction = { fg = p.purple },
  CmpItemKindMethod = { fg = p.purple },
  CmpItemKindClass = { fg = p.orange },
  CmpItemKindVariable = { fg = p.orange },
  CmpItemKindInterface = { fg = p.red },
  CmpItemKindKeyword = { fg = p.red },
  CmpItemKindSnippet = { fg = p.green },
  CmpItemKindText = { fg = p.fg_soft },
}

for group, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, group, spec)
end

-- vim: ts=2 sts=2 sw=2 et
