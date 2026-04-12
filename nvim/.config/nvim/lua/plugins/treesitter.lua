vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").install({
    "bash",
    "http",
    "c",
    "diff",
    "html",
    "lua",
    "luadoc",
    "query",
    "vim",
    "vimdoc",
    "java",
    "sql",
    "javadoc",
    "javascript",
    "typescript",
    "http",
    "graphql",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
