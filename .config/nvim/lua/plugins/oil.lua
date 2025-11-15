return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      padding = 2,
      max_width = 0.5,
      max_height = 0.5,
      border = nil,
      win_options = {
        winblend = 0,
      },
      get_win_title = nil,
      preview_split = "auto",
      override = function(conf)
        return conf
      end,
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
