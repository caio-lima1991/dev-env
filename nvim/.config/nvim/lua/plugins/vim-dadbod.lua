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
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },

    keys = {
      { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },

    init = function()
      local data_path = "~/.local/share/db_ui/"

      vim.g.db_ui_save_location = data_path
      vim.g.db_ui_tmp_query_location = data_path .. "/tmp"

      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.dbext_default_ORA_bin = "sql"
    end,
  },
}
