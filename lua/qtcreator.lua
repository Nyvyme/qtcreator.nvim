local M = {}
local config = require("qtcreator.config")

local function set_highlights()
  local palette = require("qtcreator.palette")
  local styles = config.options.styles

  local highlights = {
    Normal = { fg = palette.fg, bg = palette.bg },

    Cursor = { fg = palette.bg, bg = palette.fg },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    CursorColumn = { fg = palette.bg, bg = palette.fg },
    ColorColumn = { bg = palette.cc_bg },
    PreProc = { fg = palette.pink },
    PreCond = { link = "PreProc" },
    LineNr = { fg = palette.greylight, bg = palette.linenr_bg },
    CursorLine = { bg = palette.bg_light },
    CursorLineNr = {
      fg = palette.yellow,
      bg = palette.linenr_bg,
      bold = styles.bold
    },
    Whitespace = { fg = palette.ws },
    Visual = { fg = palette.greylight, bg = palette.cyan },
    VisualNOS = { fg = palette.greylight, bg = palette.cyandark },
    MatchParen = { fg = palette.fg, bg = palette.cyandark },
    WinSeparator = { fg = palette.greylight, bg = palette.linenr_bg },
    ModeMsg = { fg = palette.greylight, bg = palette.linenr_bg },
    MsgArea = { fg = palette.greylight, bg = palette.linenr_bg },

    LspCodeLens = { fg = palette.greylight, bg = palette.cyan },
    LspReferenceRead = { bg = palette.cyandark },
    LspReferenceText = { bg = palette.cyandark },
    LspReferenceWrite = { bg = palette.cyandark },

    StatusLine = { fg = palette.greylight, bg = palette.linenr_bg },
    StatusLineNC = { link = "StatusLine" },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLine" },

    Boolean = { fg = palette.cyanlight, italic = styles.italic },
    Character = { fg = palette.brown },
    String = { fg = palette.brown },
    Define = { fg = palette.pink },
    Number = { fg = palette.darkbrown },
    Error = { fg = palette.reddark },
    Special = { fg = palette.brown },
    SpecialChar = { link = "Special" },
    Identifier = { fg = palette.fg },
    Type = { fg = palette.red },
    TypeDef = { fg = palette.cyanlight, bold = styles.bold },
    Macro = { fg = palette.pink },
    Include = { fg = palette.pink },
    Label = { fg = palette.yellow, bold = styles.bold },
    Statement = { fg = palette.cyanlight, italic = styles.italic },
    Keyword = { fg = palette.cyanlight, italic = styles.italic },
    Function = { bold = styles.bold },
    Operator = { fg = palette.peach },
    Comment = { fg = palette.grey, italic = styles.italic },
    Structure = { fg = palette.cyanlight, italic = styles.italic },
    Repeat = { fg = palette.cyanlight, italic = styles.italic },
    Conditional = { fg = palette.cyanlight, italic = styles.italic },
    Float = { link = "Number" },

    GitSignsAdd = { fg = palette.reddark, bg = "NONE" },
    GitSignsChange = { fg = palette.reddark, bg = "NONE" },
    GitSignsDelete = { fg = palette.reddark, bg = "NONE" },

    ["@variable"] = { fg = palette.fg },
    ["@variable.builtin"] = { fg = palette.cyanlight, italic = styles.italic },
    ["@variable.parameter"] = { fg = palette.peach },
    ["@variable.member"] = { fg = palette.peach },

    ["@constant"] = { fg = palette.fg },
    ["@constant.builtin"] = { fg = palette.cyanlight, italic = styles.italic },
    ["@constant.macro"] = { fg = palette.fg },

    ["@constructor"] = { fg = palette.fg, bold = styles.bold },

    ["@function"] = { link = "Function" },
    ["@function.macro"] = { fg = palette.fg, italic = false },
    ["@function.method"] = { link = "Function" },
    ["@function.call"] = { fg = palette.fg, bold = false },
    ["@function.method.call"] = { fg = palette.fg, bold = false },

    ["@type"] = { fg = palette.red },
    ["@type.builtin"] = { fg = palette.purple },
    ["@type.definition"] = { fg = palette.red, bold = true },

    ["@keyword.directive"] = { link = "Define" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.directive.define"] = { link = "Define" },

    ["@punctuation.delimiter"] = { fg = palette.fg },
    ["@punctuation.bracket"] = { fg = palette.fg },
    ["@punctuation.special"] = { fg = palette.peach },

    ["@module"] = { fg = palette.red },
    ["@module.builtin"] = { fg = palette.cyanlight, italic = styles.italic },

    ["@lsp.type.macro"] = { fg = palette.red },
    ["@lsp.type.variable"] = { fg = palette.peach },
    ["@lsp.type.enumMember"] = { fg = palette.green, italic = styles.italic },
    ["@lsp.type.property"] = { fg = palette.fg, bold = styles.bold },
    ["@lsp.mod.definition"] = { bold = styles.bold },
  }

  for group, highlight in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, highlight)
  end
end

function M.colorscheme(variant)
  vim.opt.termguicolors = true
  if vim.g.colors_name then
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "qtcreator"

  vim.o.background = "dark"

  set_highlights()
end

function M.setup(options)
  config.extend_options(options or {})
end

return M
