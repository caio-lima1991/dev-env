vim.keymap.set("n", "<leader>n", function()
    vim.cmd("edit ~/vim_notes/my_notes.md")
end, { desc = "Open my notes" })
