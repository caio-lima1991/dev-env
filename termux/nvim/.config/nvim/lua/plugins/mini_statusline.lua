return {
  "nvim-mini/mini.statusline",

  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },

  version = false,

  config = function()
    require("mini.statusline").setup()
  end,
}
