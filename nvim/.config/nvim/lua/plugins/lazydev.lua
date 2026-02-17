return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  dependencies = {},
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
