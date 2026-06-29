local opt = vim.opt
local fn = vim.fn

opt.termguicolors = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.swapfile = false
opt.splitright = true
opt.splitbelow = true
opt.foldenable = false
opt.conceallevel = 1
opt.fillchars = { eob = " " }

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.exrc = true

opt.undofile = true
opt.undodir = fn.stdpath("data") .. "/undo"
opt.undolevels = 1000

opt.completeopt = { "menu", "popup", "menuone", "noinsert", "noselect" }

local g = vim.g
g.mapleader = " "
g.clipboard = "osc52"

local o = vim.o
o.winborder = "rounded"
o.confirm = true
