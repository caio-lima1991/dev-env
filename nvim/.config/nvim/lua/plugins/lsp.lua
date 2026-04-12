vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
	"bashls",
	"cssls",
	"html",
	"lua_ls",
	"markdown_oxide",
	"pyright",
	"ts_ls",
})
