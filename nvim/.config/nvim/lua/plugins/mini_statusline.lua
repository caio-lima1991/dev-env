return {
  "nvim-mini/mini.statusline",

  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },

  version = false,

  config = function()
    require("mini.statusline").setup()
  end,
}
