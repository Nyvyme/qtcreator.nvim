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
    MatchParen = { fg = palette.fg, bg = palette.cyandark },

    LspCodeLens = { fg = palette.greylight, bg = palette.cyan },
    LspReferenceRead = { bg = palette.cyandark },
    LspReferenceText = { bg = palette.cyandark },
    LspReferenceWrite = { bg = palette.cyandark },

    Boolean = { fg = palette.cyanlight },
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
    Constant = { fg = palette.fg },
    Float = { link = "Number" },

    GitSignsAdd = { fg = palette.reddark, bg = "NONE" },
    GitSignsChange = { fg = palette.reddark, bg = "NONE" },
    GitSignsDelete = { fg = palette.reddark, bg = "NONE" },

    ["@variable"] = { fg = palette.fg },
    ["@variable.builtin"] = { fg = palette.blue },
    ["@variable.parameter"] = { fg = palette.peach, bold = styles.bold },
    ["@variable.member"] = { fg = palette.peach },

    ["@constant"] = { fg = palette.green, italic = styles.italic },
    ["@constant.builtin"] = { fg = palette.cyanlight, italic = false },
    ["@constant.macro"] = { fg = palette.fg, italic = false },

    ["@function"] = { link = "Function" },
    ["@function.macro"] = { link = "Macro" },
    ["@function.method"] = { link = "Function" },
    ["@function.call"] = { bold = false },
    ["@function.method.call"] = { bold = false },

    ["@type"] = { fg = palette.red },
    ["@type.builtin"] = { fg = palette.purple },

    ["@keyword.directive"] = { link = "Macro" },
    ["@keyword.directive.define"] = { link = "Define" },

    ["@punctuation.special"] = { fg = palette.peach },
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
