return {
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- Can be loaded later if you aren't using it immediately
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.cmd([[colorscheme everforest]])
    end,
  },
}
