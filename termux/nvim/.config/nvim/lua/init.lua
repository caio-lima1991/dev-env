require("core.options")
require("core.autocmd")

vim.lsp.config("marksman", {
	cmd = { "marksman", "server" },
	filetypes = { "markdown", "markdown.mdx" },
})

vim.lsp.enable("marksman")
