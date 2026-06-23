vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
    "bashls",
    "cssls",
    "html",
    "lua_ls",
    "pyright",
    "ts_ls",
    "angularls",
    "lemminx",
    "marksman"
})
