vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
        vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip", "https://github.com/rafamadriz/friendly-snippets" })
        vim.cmd("packadd luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
})
