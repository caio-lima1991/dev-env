return {
  "stevearc/oil.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory in float" },
  },

  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 0.8,
      max_height = 0.8,
      border = "rounded",
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Operator,CursorLine:Visual",
        winblend = 0,
      },
    },
  },
}
