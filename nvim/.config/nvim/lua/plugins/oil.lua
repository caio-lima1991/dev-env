vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 2,
		max_width = 0.8,
		max_height = 0.8,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		preview_split = "auto",
	},
})
