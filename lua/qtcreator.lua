local M = {}
local config = require("qtcreator.config")

local function set_highlights()
  local palette = require("qtcreator.palette")
  local styles = config.options.styles

  local highlights = {
    Normal = { fg = palette.fg, bg = palette.bg },

    Character = { fg = palette.brown },
    String = { fg = palette.brown },
    Define = { fg = palette.pink },
    Number = { fg = palette.darkbrown },
    Error = { fg = palette.reddark },
    Special = { fg = palette.peach },
    SpecialChar = { link = "Special" },
    Type = { fg = palette.purple },
    TypeDef = { fg = palette.cyanlight },
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
