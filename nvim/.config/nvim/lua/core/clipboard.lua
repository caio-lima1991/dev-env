local g = vim.g
g.clipboard = "osc52"

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
