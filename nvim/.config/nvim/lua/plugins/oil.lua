vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

vim.keymap.set("n", "-", function()
	require("oil").open_float()
end, { desc = "Open parent directory" })

vim.schedule(function()
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
end)
