vim.pack.add({ "https://github.com/mistweaverco/kulala.nvim" })

require("kulala").setup({
	global_keymaps = false,
	ft = { "http", "rest" },
	opts = {
		global_keymaps = false,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http",
	callback = function(ev)
		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = "Rest: " .. desc })
		end

		vim.keymap.set("n", "<leader>R", "", { desc = "+Rest" })

		-- Keymaps only available in .http files
		map("<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", "Copy as cURL")
		map("<leader>RC", "<cmd>lua require('kulala').from_curl()<cr>", "Paste from curl")

		map("<leader>Re", "<cmd>lua require('kulala').set_selected_env()<cr>", "Set environment")
		map("<leader>Ri", "<cmd>lua require('kulala').inspect()<cr>", "Inspect current request")
		map("<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", "Jump to next request")
		map("<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", "Jump to previous request")

		map("<leader>Rq", "<cmd>lua require('kulala').close()<cr>", "Close window")
		map("<leader>Rr", "<cmd>lua require('kulala').replay()<cr>", "Replay last request")
		map("<leader>Rs", "<cmd>lua require('kulala').run()<cr>", "Send the request")
		map("<leader>RS", "<cmd>lua require('kulala').show_stats()<cr>", "Show stats")
		map("<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", "Toggle headers/body")
	end,
})
