vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

require("tree-sitter-manager").setup({
	parser_install_dir = vim.fn.stdpath("data") .. "/site",
	auto_install = true,
	ensure_installed = {
		"bash",
		"http",
		"diff",
		"html",
		"query",
		"java",
		"sql",
		"javadoc",
		"javascript",
		"typescript",
		"http",
		"graphql",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
		pcall(vim.treesitter.start)
	end,
})
