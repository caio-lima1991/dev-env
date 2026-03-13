return {
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },

    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>dbu", "<cmd>DBUIToggle<cr>",        desc = "DB: Toggle UI" },
      { "<leader>dbf", "<cmd>DBUIFindBuffer<cr>",    desc = "DB: Find Buffer" },
      { "<leader>dbr", "<cmd>DBUIRenameBuffer<cr>",  desc = "DB: Rename Buffer" },
      { "<leader>dbl", "<cmd>DBUILastQueryInfo<cr>", desc = "DB: Last Query Info" },
      { "<leader>dbx", "<cmd>DBUIExecuteQuery<cr>",  desc = "DB: Execute Query" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_win_width = 35

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          require("lazy").load({ plugins = { "vim-dadbod" } })
        end,
      })
    end,
    config = function()
      require("lazy").load({ plugins = { "vim-dadbod" } })
    end,
  },
}
