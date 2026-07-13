vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.java",
  callback = function()
    vim.opt_local.fileencoding = "latin1"
    vim.cmd("edit ++enc=latin1")
  end
})
