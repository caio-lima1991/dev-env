vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.clipboard = "osc52"
vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {

    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },

    paste = {
      ["+"] = function()
        return {
          vim.split(vim.fn.getreg('"'), "\n"),
          vim.fn.getregtype('"'),
        }
      end,
      ["*"] = function()
        return {
          vim.split(vim.fn.getreg('"'), "\n"),
          vim.fn.getregtype('"'),
        }
      end,
    },
  }
end

-- Neovim only
require("config.lazy")
require("init")
