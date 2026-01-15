return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  config = function()
    require("nvim-treesitter").install({
      "bash",
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
    })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end
    })
  end
}
