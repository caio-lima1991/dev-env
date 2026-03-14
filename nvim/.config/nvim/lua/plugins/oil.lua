return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.8,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      preview_split = "auto",
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
