return {
  {
    "tpope/vim-dadbod",
    lazy = true,
    cmd = "DB",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },

    keys = {
      { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },

    init = function()
      local data_path = "~/.local/share/"

      vim.g.db_ui_save_location = data_path .. "/db_ui"
      vim.g.db_ui_tmp_query_location = data_path .. "/db_ui/tmp"
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true

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
