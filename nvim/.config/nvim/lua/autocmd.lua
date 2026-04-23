local lsp_group = vim.api.nvim_create_augroup("my.lsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,

	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
			buffer = ev.buf,
			desc = "Code Action",
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		vim.opt_local.omnifunc = "vim_dadbod_completion#omni"
	end,
})
