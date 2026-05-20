vim.keymap.set("v", "<leader>Y", '"+y', { desc = "Copy selection to clipboard" })

vim.keymap.set("n", "<leader>n", function()
	vim.cmd("edit ~/vim_notes/my_notes.md")
end, { desc = "Open my notes" })

vim.keymap.set("n", "<leader>u", function()
	vim.cmd("FzfLua undotree")
end, { desc = "Open undotree" })

vim.api.nvim_create_user_command("CopyPath", function()
	local path = vim.fn.expand("%:p")

	vim.fn.setreg("+", path)
	vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute file path to clipboard" })

vim.api.nvim_create_user_command("CopyRelPath", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path to clipboard" })
