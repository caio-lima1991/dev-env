vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.clipboard = "osc52"
vim.opt.clipboard = "unnamedplus"

-- Neovim only
require("config.lazy")
require("init")
