return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      delay = 0,
      spec = {
        { "<leader>u", group = "Undotree", mode = { "n" } },
      },
    },
  },
}
