vim.pack.add({ "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/kristijanhusak/vim-dadbod-completion" })

local data_path = "~/.local/share/db_ui/"

vim.g.db_ui_save_location = data_path
vim.g.db_ui_tmp_query_location = data_path .. "/tmp"

vim.g.db_ui_show_database_icon = true
vim.g.db_ui_use_nerd_fonts = true

vim.keymap.set('n', "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI" })
