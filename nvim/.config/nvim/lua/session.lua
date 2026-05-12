vim.pack.add({ "https://github.com/rmagatti/auto-session" })
require("auto-session").setup({
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		session_lens = {
			picker = "select",
		},
	},

	pre_restore_cmds = {
		function()
			local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
			local clients = get_clients()

			for _, client in ipairs(clients) do
				vim.lsp.stop_client(client.id, true)
			end
		end,

		"silent! %bd!",
	},
})

vim.keymap.set("n", "<leader>qr", "<cmd>AutoSession search<CR>", { desc = "Session search" })
vim.keymap.set("n", "<leader>qs", "<cmd>AutoSession save<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>qa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })
