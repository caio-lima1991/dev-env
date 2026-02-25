vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.clipboard = "osc52"

vim.g.clipboard = {

  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },

  paste = {
    ["+"] = function()
      return {}
    end,
    ["*"] = function()
      return {}
    end,
  },
}

vim.opt.clipboard = "unnamedplus"

-- Neovim only
require("config.lazy")
require("init")
